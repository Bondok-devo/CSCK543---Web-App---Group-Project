<?php
/**
 * File: logout.php
 * Owner: Person B (Full-Stack Developer)
 * Purpose: Destroys the user's session data to log them out of the application.
 * Dependencies: Relies on an active session to destroy.
 */

session_start(); // Resume the session

// Unset all of the session variables
$_SESSION = array();

// Destroy the session
session_destroy();

// Redirect to the homepage after logging out
header("Location: index.php");
exit();
?>

