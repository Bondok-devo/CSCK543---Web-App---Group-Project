<?php
/**
 * File: login.php
 * Owner: Person B (Full-Stack Developer)
 * Purpose: Provides the form for users to log in. It will also contain the
 * server-side PHP logic to handle the login attempt, verify credentials
 * against the database, and manage user sessions.
 * Dependencies: Relies on Person A's database connection and the 'users' table.
 */

// --- PHP logic for handling login and HTML for the form will go here ---

session_start(); // Start the session

// Define variables to hold messages
$login_error = '';
$success_message = '';

// Check if there's a success message from registration
if (isset($_SESSION['success_message'])) {
    $success_message = $_SESSION['success_message'];
    unset($_SESSION['success_message']); // Clear the message after displaying it
}

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    if (empty($email) || empty($password)) {
        $login_error = "Both email and password are required.";
    } else {
        // --- MOCK DATABASE CHECK ---
        // This is where you will query the database to find the user by email.
        // For now, we will use a hardcoded "mock" user to test the logic.
        
        $mock_user_email = "test@example.com";
        // This hash is for the password "password123"
        $mock_user_hashed_password = password_hash("password123", PASSWORD_DEFAULT); 

        // To test this login, you would use:
        // Email: test@example.com
        // Password: password123

        // Simulate checking if the user exists and the password is correct
        if ($email === $mock_user_email && password_verify($password, $mock_user_hashed_password)) {
            // Password is correct, so start a new session
            $_SESSION['loggedin'] = true;
            $_SESSION['email'] = $email; // In reality, you'd store user ID and name
            $_SESSION['user_id'] = 1; // Mock user ID

            // Redirect to the user's account page
            header("Location: account.php");
            exit();
        } else {
            $login_error = "Invalid email or password.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Recipe App</title>
</head>
<body>

    <!-- We will include the header here later using PHP -->
    <!-- <?php // include 'includes/header.php'; ?> -->

    <h1>Log In to Your Account</h1>

    <?php
    if (!empty($success_message)) {
        echo '<p style="color: green;">' . htmlspecialchars($success_message) . '</p>';
    }
    if (!empty($login_error)) {
        echo '<p style="color: red;">' . htmlspecialchars($login_error) . '</p>';
    }
    ?>

    <form action="login.php" method="POST">
        <div>
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <br>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <br>
        <button type="submit">Log In</button>
    </form>
    
    <p>Don't have an account? <a href="register.php">Register here</a>.</p>

    <!-- We will include the footer here later using PHP -->
    <!-- <?php // include 'includes/footer.php'; ?> -->

</body>
</html>

