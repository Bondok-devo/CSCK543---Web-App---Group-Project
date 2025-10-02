<?php
/**
 * File: login.php
 * Purpose: Handles user authentication. Displays the login form and processes credentials.
 */
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

// If a user is already logged in, redirect them to their account page.
if (current_user_id()) {
    header('Location: account.php');
    exit;
}

$errors = [];
// Retrieve and then clear any success message from the session (e.g., from registration).
$success_message = $_SESSION['success_message'] ?? null;
unset($_SESSION['success_message']);

// Process form submission.
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    // The login function from auth.php handles credential verification.
    if (login($pdo, $email, $password)) {
        header('Location: account.php');
        exit;
    } else {
        $errors[] = 'Invalid email or password.';
    }
}
?>

<form class="auth-form" action="login.php" method="post">
    <h2>Sign In</h2>

    <?php if ($success_message): ?>
        <div class="alert alert-success"><?= e($success_message) ?></div>
    <?php endif; ?>

    <?php if (!empty($errors)): ?>
        <div class="alert alert-danger">
            <?php foreach ($errors as $error): ?>
                <p><?= e($error) ?></p>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>

    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
    
    <?= csrf_field() // Output the CSRF hidden input field for security. ?>
    
    <button type="submit">Login</button>

    <p class="form-footer">Don't have an account? <a href="register.php">Register here</a></p>
</form>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>

