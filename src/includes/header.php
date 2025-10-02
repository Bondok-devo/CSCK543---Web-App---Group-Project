<?php
declare(strict_types=1);
// These files are in the same directory, so we can use __DIR__
require_once __DIR__ . '/auth.php';
require_once __DIR__ . '/utils.php';
require_once __DIR__ . '/db.php'; // Ensure DB connection is available
require_once __DIR__ . '/csrf.php';

start_secure_session();
$cfg = require __DIR__ . '/../config.php';
$base = rtrim($cfg['app']['base_url'], '/');
?>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Recipe Web App</title>
<link rel="stylesheet" href="<?= e($base) ?>/public/assets/css/style.css">
</head>
<body>
<a class="skip-link" href="#main">Skip to content</a>
<header class="site-header"><div class="container">
  <a class="brand" href="<?= e($base) ?>/public/index.php">🍳 Recipe Web App</a>
  <nav aria-label="Primary"><ul class="nav">
    <li><a href="<?= e($base) ?>/public/index.php">Home</a></li>
    <?php if (current_user_id()): ?>
        <li><a href="<?= e($base) ?>/public/account.php">Account</a></li>
        <li><a href="<?= e($base) ?>/public/logout.php">Log Out</a></li>
    <?php else: ?>
        <li><a href="<?= e($base) ?>/public/register.php">Register</a></li>
        <li><a href="<?= e($base) ?>/public/login.php">Login</a></li>
    <?php endif; ?>
  </ul></nav>
</div></header>
<main id="main" class="container" tabindex="-1">
<div id="toast" role="status" aria-live="polite" class="toast" hidden></div>
