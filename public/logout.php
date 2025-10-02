<?php
/**
 * File: logout.php
 * Purpose: Handles the user logout process. Destroys the session and redirects to the login page.
 */
declare(strict_types=1);

// The auth.php file is required to access the logout function.
require_once __DIR__ . '/../src/includes/auth.php';

// Start the session to be able to destroy it.
start_secure_session();

// Call the central logout function.
logout();

// Redirect the user to the login page after logging out.
header('Location: login.php');
exit;
