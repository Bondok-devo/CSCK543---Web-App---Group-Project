<?php
/**
 * File: register.php
 * Purpose: Handles new user registration. Displays the registration form and processes new user data.
 */
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

// If a user is already logged in, redirect them away from the registration page.
if (current_user_id()) {
    header('Location: account.php');
    exit;
}

$errors = [];
$old_data = []; // To repopulate form fields on error.

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();

    // Sanitize and retrieve form data.
    $name = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $old_data = ['name' => $name, 'email' => $email];

    // Server-side validation rules.
    if (empty($name)) $errors['name'] = 'Name is required.';
    if (empty($email)) $errors['email'] = 'Email is required.';
    elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) $errors['email'] = 'Invalid email format.';
    if (empty($password)) $errors['password'] = 'Password is required.';
    elseif (strlen($password) < 8) $errors['password'] = 'Password must be at least 8 characters.';

    // If validation passes, proceed with database checks.
    if (empty($errors)) {
        // Check if the email address is already in use.
        $stmt = $pdo->prepare('SELECT id FROM users WHERE email = ?');
        $stmt->execute([$email]);
        if ($stmt->fetch()) {
            $errors['email'] = 'An account with this email already exists.';
        } else {
            // Hash the password and insert the new user into the database.
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare('INSERT INTO users (name, email, password_hash) VALUES (?, ?, ?)');
            if ($stmt->execute([$name, $email, $hashed_password])) {
                $_SESSION['success_message'] = 'Registration successful! Please log in.';
                header('Location: login.php');
                exit;
            } else {
                $errors['form'] = 'An unexpected error occurred during registration. Please try again.';
            }
        }
    }
}
?>

<div class="auth-form">
    <h2>Create an Account</h2>

    <?php if (isset($errors['form'])): ?>
        <div class="alert alert-danger"><?= e($errors['form']) ?></div>
    <?php endif; ?>

    <form action="register.php" method="post">
        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" value="<?= e($old_data['name'] ?? '') ?>" required>
            <?php if (isset($errors['name'])): ?><p class="error-text"><?= e($errors['name']) ?></p><?php endif; ?>
        </div>
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" value="<?= e($old_data['email'] ?? '') ?>" required>
            <?php if (isset($errors['email'])): ?><p class="error-text"><?= e($errors['email']) ?></p><?php endif; ?>
        </div>
        <div class="form-group">
            <label for="password">Password (min. 8 characters)</label>
            <input type="password" id="password" name="password" required>
            <?php if (isset($errors['password'])): ?><p class="error-text"><?= e($errors['password']) ?></p><?php endif; ?>
        </div>
        
        <?= csrf_field() ?>

        <button type="submit">Register</button>
        <p class="form-footer">Already have an account? <a href="login.php">Log in here</a></p>
    </form>
</div>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>

