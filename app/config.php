<?php
declare(strict_types=1);

/**
 * App configuration
 * - Override via environment variables when available
 * - Falls back to development-friendly defaults
 */

$env = getenv('APP_ENV') ?: 'dev';

// Database settings
$dbHost    = getenv('DB_HOST') ?: '127.0.0.1';
$dbPort    = (int) (getenv('DB_PORT') ?: 3306);
$dbName    = getenv('DB_NAME') ?: 'Recipe_web_app';
$dbUser    = getenv('DB_USER') ?: 'root';
$dbPass    = getenv('DB_PASS') ?: 'fyzmo2-cemnax-guCjum';
$dbCharset = 'utf8mb4';

// Base URL:
// 1) Use APP_BASE_URL if provided (e.g., "/recipe_web_app")
// 2) Otherwise try to auto-detect a path
// 3) Fall back to "/recipe_web_app"
$baseFromEnv = getenv('APP_BASE_URL');
if ($baseFromEnv !== false && $baseFromEnv !== '') {
    $baseUrl = rtrim($baseFromEnv, '/');
} else {
    // Attempt a lightweight auto-detect
    $scriptName     = $_SERVER['SCRIPT_NAME'] ?? '';
    $documentRoot   = isset($_SERVER['DOCUMENT_ROOT']) ? str_replace('\\', '/', rtrim($_SERVER['DOCUMENT_ROOT'], '/')) : '';
    $scriptFilename = isset($_SERVER['SCRIPT_FILENAME']) ? str_replace('\\', '/', rtrim($_SERVER['SCRIPT_FILENAME'], '/')) : '';

    $detected = '';
    if ($documentRoot && $scriptFilename && strpos($scriptFilename, $documentRoot) === 0) {
        $detected = dirname(substr($scriptFilename, strlen($documentRoot))) ?: '/';
    } elseif ($scriptName) {
        $detected = dirname($scriptName);
    }

    $detected = rtrim($detected, '/');
    $baseUrl  = $detected !== '' ? $detected : '/recipe_web_app';
}

// Optional cookie hardening behind proxies/CDN
$forceSecureCookies = (bool) (getenv('FORCE_SECURE_COOKIES') ?: false);

return [
    'env' => $env,
    'db'  => [
        'host'    => $dbHost,
        'port'    => $dbPort,
        'name'    => $dbName,
        'user'    => $dbUser,
        'pass'    => $dbPass,
        'charset' => $dbCharset,
    ],
    'app' => [
        // Example: "/recipe_web_app" (no trailing slash)
        'base_url'            => $baseUrl,
        'force_secure_cookies'=> $forceSecureCookies,
    ],
];