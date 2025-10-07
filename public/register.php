<?php
/**
 * File: register.php
 * Purpose: Provides the registration form and handles new user creation.
 */
declare(strict_types=1);

// Logic-only includes. This MUST come before any HTML output.
require_once __DIR__ . '/../src/includes/db.php';
require_once __DIR__ . '/../src/includes/auth.php';
require_once __DIR__ . '/../src/includes/csrf.php';
require_once __DIR__ . '/../src/includes/utils.php';

start_secure_session();

$errors = [];
$inputs = [];

// Redirect authenticated users away from the registration page.
if (current_user_id()) {
    header('Location: account.php');
    exit;
}

// Handle form submission.
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();

    // Sanitise and validate inputs.
    $inputs['name'] = trim($_POST['name'] ?? '');
    $inputs['email'] = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';

    if (empty($inputs['name'])) {
        $errors['name'] = 'Name is required.';
    }
    if (!filter_var($inputs['email'], FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = 'A valid email is required.';
    }
    if (strlen($password) < 8) {
        $errors['password'] = 'Password must be at least 8 characters long.';
    }

    // Check if the email already exists in the database.
    if (empty($errors['email'])) {
        $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
        $stmt->execute([$inputs['email']]);
        if ($stmt->fetch()) {
            $errors['email'] = 'This email address is already registered.';
        }
    }

    // If there are no validation errors, proceed to create the user.
    if (empty($errors)) {
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        $sql = "INSERT INTO users (name, email, password_hash) VALUES (?, ?, ?)";
        
        try {
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$inputs['name'], $inputs['email'], $hashed_password]);

            // Set a success message and redirect to the login page.
            $_SESSION['success_message'] = 'Registration successful! Please log in.';
            header('Location: login.php');
            exit;
        } catch (PDOException $e) {
            showErrorPage("An error occurred during registration. Please try again.");
            exit;
        }
    }
}

// HTML output starts HERE.
require_once __DIR__ . '/../src/includes/header.php';
?>

<div class="auth-container">
    <form class="auth-form" action="register.php" method="post" novalidate>
        <h2>Create an Account</h2>
        <p>Join our community to save your favourite recipes.</p>

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<?= e($inputs['name'] ?? '') ?>" required>
            <?php if (isset($errors['name'])): ?>
                <span class="error-message"><?= e($errors['name']) ?></span>
            <?php endif; ?>
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<?= e($inputs['email'] ?? '') ?>" required>
            <?php if (isset($errors['email'])): ?>
                <span class="error-message"><?= e($errors['email']) ?></span>
            <?php endif; ?>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <?php if (isset($errors['password'])): ?>
                <span class="error-message"><?= e($errors['password']) ?></span>
            <?php endif; ?>
        </div>
        
        <?= csrf_field() ?>

        <button type="submit">Register</button>

        <p class="auth-switch">Already have an account? <a href="login.php">Log in here</a></p>
    </form>
</div>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
