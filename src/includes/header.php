<?php
// File: src/includes/header.php
declare(strict_types=1);

// This single require brings in all necessary files and starts the session.
require_once __DIR__ . '/auth.php';
require_once __DIR__ . '/utils.php';
require_once __DIR__ . '/db.php'; // Ensures DB connection is made

// --- START LIGHTHOUSE IMPROVEMENT: CACHING ---
// Set cache headers for static assets to improve performance on repeat visits.
// This checks if the requested URL ends with a common static file extension.
$asset_extensions = ['css', 'js', 'jpg', 'jpeg', 'png', 'gif', 'svg'];
$request_uri_path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$file_extension = pathinfo($request_uri_path, PATHINFO_EXTENSION);

if (in_array($file_extension, $asset_extensions)) {
    // Cache for 1 day
    header("Cache-Control: max-age=86400, public");
    header("Expires: " . gmdate('D, d M Y H:i:s', time() + 86400) . ' GMT');
}
// --- END LIGHTHOUSE IMPROVEMENT ---

start_secure_session();

$cfg = require __DIR__ . '/../config.php';
$base_url = e($cfg['app']['base_url'] ?? '');

$current_user_id = current_user_id();
$current_user_name = null;

// If user is logged in, fetch their name for the dropdown
if ($current_user_id) {
    try {
        $stmt = $pdo->prepare("SELECT name FROM users WHERE id = ?");
        $stmt->execute([$current_user_id]);
        $user = $stmt->fetch();
        if ($user) {
            $current_user_name = $user['name'];
        }
    } catch (PDOException $e) {
        // Silently fail, user name will be null
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Savory Spoon</title>
    <link rel="stylesheet" href="<?= $base_url ?>/public/assets/css/style.css">
</head>
<body>
<a class="skip-link" href="#main">Skip to content</a>
<header class="site-header">
    <div class="container header-container">
        <a class="brand" href="<?= $base_url ?>/public/index.php">🍳 Savory Spoon</a>
        
        <button class="menu-toggle" aria-controls="primary-navigation" aria-expanded="false">
            <span class="sr-only">Menu</span>
            ☰
        </button>

        <nav id="primary-navigation" class="primary-navigation">
            <?php if ($current_user_id && $current_user_name): ?>
                <div class="user-menu">
                    <button class="user-menu-button" aria-haspopup="true" aria-expanded="false">
                        Hi, <?= e(explode(' ', $current_user_name)[0]) ?>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="<?= $base_url ?>/public/account.php">My Account</a></li>
                        <li><a href="<?= $base_url ?>/public/logout.php">Logout</a></li>
                    </ul>
                </div>
            <?php else: ?>
                <ul class="guest-menu">
                    <li><a href="<?= $base_url ?>/public/login.php">Login</a></li>
                    <li><a href="<?= $base_url ?>/public/register.php" class="button button-primary">Register</a></li>
                </ul>
            <?php endif; ?>
        </nav>
    </div>
</header>
<main id="main" class="container" tabindex="-1">
    <div id="toast" role="status" aria-live="polite" class="alert" hidden></div>
    