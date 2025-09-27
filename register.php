<?php
/**
 * File: register.php
 * Owner: Person B (Full-Stack Developer)
 * Purpose: Provides the form for new users to register. It also contains the
 * server-side PHP logic to validate and process the registration data.
 * Dependencies: Will rely on Person A's db_connect.php for database insertion.
 */

// --- PHP logic for handling registration and HTML for the form will go here ---

session_start(); // Start the session to manage user login state

// Define a variable to hold registration error messages
$registration_error = '';

// Check if the form has been submitted using the POST method
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // --- 1. GET USER DATA ---
    // Trim whitespace from user inputs
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    // --- 2. SERVER-SIDE VALIDATION ---
    if (empty($name) || empty($email) || empty($password)) {
        $registration_error = "All fields are required. Please fill them all out.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $registration_error = "Invalid email format. Please enter a valid email address.";
    } elseif (strlen($password) < 8) {
        $registration_error = "Password must be at least 8 characters long.";
    } else {
        // --- 3. PROCESS DATA (Password Hashing) ---
        // If validation passes, hash the password for security
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // --- MOCK DATABASE INSERTION ---
        // This is the part you will replace with the actual database query
        // once Person A provides the `db_connect.php` file.
        // For now, we'll simulate success and redirect to the login page.
        
        // Let's store a success message in the session to display on the login page
        $_SESSION['success_message'] = "Registration successful! Please log in.";

        // Redirect to the login page
        header("Location: login.php");
        exit(); // Always call exit() after a header redirect
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Recipe App</title>
    <!-- Link to the stylesheet will go here later -->
    <!-- <link rel="stylesheet" href="css/style.css"> -->
</head>
<body>

    <!-- We will include the header here later using PHP -->
    <!-- <?php // include 'includes/header.php'; ?> -->

    <h1>Create an Account</h1>
    <p>Join our community to save and rate your favourite recipes!</p>

    <?php
    // Display the registration error message if it's not empty
    if (!empty($registration_error)) {
        echo '<p style="color: red;">' . htmlspecialchars($registration_error) . '</p>';
    }
    ?>

    <form action="register.php" method="POST">
        <div>
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <br>
        <div>
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <br>
        <div>
            <label for="password">Password (min. 8 characters):</label>
            <input type="password" id="password" name="password" required>
        </div>
        <br>
        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.php">Log in here</a>.</p>

    <!-- We will include the footer here later using PHP -->
    <!-- <?php // include 'includes/footer.php'; ?> -->

</body>
</html>

