<?php
/**
 * File: account.php
 * Owner: Person B (Full-Stack Developer)
 * Purpose: A protected page for the logged-in user. It will display user
 * information and their list of saved favourite recipes.
 * Dependencies: Logic depends on the session started in login.php.
 */

session_start(); // Resume the session

// --- PAGE PROTECTION ---
// Check if the user is logged in. If not, redirect to login page.
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: login.php");
    exit();
}

// If they are logged in, you can display their info
$user_email = $_SESSION['email'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account - Recipe App</title>
</head>
<body>
    
    <h1>Welcome to Your Account</h1>
    <p>Hello, <strong><?php echo htmlspecialchars($user_email); ?></strong>!</p>
    
    <p>This is your personal account page. From here you can manage your details and view your favourite recipes.</p>

    <h2>My Favourite Recipes</h2>
    <p><em>(The list of favourite recipes will be fetched from the database and displayed here.)</em></p>
    <ul>
        <li>Mock Recipe 1</li>
        <li>Mock Recipe 2</li>
    </ul>

    <p><a href="logout.php">Log Out</a></p>

</body>
</html>

