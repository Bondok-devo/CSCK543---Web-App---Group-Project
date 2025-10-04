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
$dbName    = getenv('DB_NAME') ?: 'Recipe_web_app'; // IMPORTANT: Make sure this matches your DB name
$dbUser    = getenv('DB_USER') ?: 'root';
$dbPass    = getenv('DB_PASS') ?: ''; // Set to empty for default XAMPP
$dbCharset = 'utf8mb4';

// Base URL:
// 1) Use APP_BASE_URL if provided (e.g., "/recipe_web_app")
// 2) Otherwise try to auto-detect a path
// 3) Fall back to a default
$baseFromEnv = getenv('APP_BASE_URL');
if ($baseFromEnv !== false && $baseFromEnv !== '') {
    $baseUrl = rtrim($baseFromEnv, '/');
} else {
    // Attempt a lightweight auto-detect
    $scriptName     = $_SERVER['SCRIPT_NAME'] ?? '';
    $detected = rtrim(dirname($scriptName), '/\\');
    // Assuming the project root is one level above 'public'
    $baseUrl = str_replace('/public', '', $detected);
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
        'base_url'            => $baseUrl,
        'force_secure_cookies'=> $forceSecureCookies,
    ],
];
