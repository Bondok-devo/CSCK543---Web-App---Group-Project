<?php
/**
 * File: login.php
 * Purpose: Provides the login form and handles user authentication.
 */
declare(strict_types=1);

// Logic-only includes. This MUST come before any HTML output.
require_once __DIR__ . '/../src/includes/db.php';
require_once __DIR__ . '/../src/includes/auth.php';
require_once __DIR__ . '/../src/includes/csrf.php';
require_once __DIR__ . '/../src/includes/utils.php';

start_secure_session();

$errors = [];
$email_input = '';

// Redirect authenticated users away from the login page.
if (current_user_id()) {
    header('Location: account.php');
    exit;
}

// Handle form submission.
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();

    $email_input = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    // Attempt to log the user in.
    if (login($pdo, $email_input, $password)) {
        // On success, redirect to the account page.
        header('Location: account.php');
        exit;
    } else {
        $errors['credentials'] = 'Invalid email or password.';
    }
}

// HTML output starts HERE.
require_once __DIR__ . '/../src/includes/header.php';
?>

<div class="auth-container">
    <form class="auth-form" action="login.php" method="post" novalidate>
        <h2>Sign In</h2>

        <?php if (isset($errors['credentials'])): ?>
            <div class="alert alert-error"><?= e($errors['credentials']) ?></div>
        <?php endif; ?>

        <?php if (isset($_SESSION['success_message'])): ?>
            <div class="alert alert-success"><?= e($_SESSION['success_message']) ?></div>
            <?php unset($_SESSION['success_message']); ?>
        <?php endif; ?>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<?= e($email_input) ?>" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        
        <?= csrf_field() ?>

        <button type="submit">Login</button>

        <p class="auth-switch">Don't have an account? <a href="register.php">Register here</a></p>
    </form>
</div>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
