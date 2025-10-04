<?php
/**
 * File: auth.php
 * Purpose: Handles all authentication-related functions like sessions, login, logout, and access control.
 */
declare(strict_types=1);

/**
 * Starts a secure PHP session if one is not already active.
 * Configures session cookies for security (HttpOnly, SameSite=Lax).
 */
function start_secure_session(): void {
    if (session_status() !== PHP_SESSION_ACTIVE) {
        $forceSecure = (bool) (getenv('FORCE_SECURE_COOKIES') ?: false);
        session_set_cookie_params([
            'secure' => ($forceSecure || !empty($_SERVER['HTTPS'])),
            'httponly' => true,
            'samesite' => 'Lax'
        ]);
        session_start();
        // Regenerate session ID on first initialization to prevent session fixation.
        if (!isset($_SESSION['initiated'])) {
            session_regenerate_id(true);
            $_SESSION['initiated'] = true;
        }
    }
}

/**
 * Retrieves the ID of the currently logged-in user.
 *
 * @return int|null The user's ID if logged in, otherwise null.
 */
function current_user_id(): ?int {
    return $_SESSION['user_id'] ?? null;
}

/**
 * Checks if a user is logged in. If not, redirects them to the login page.
 * This function should be called at the top of any page that requires authentication.
 */
function require_login(): void {
    if (!current_user_id()) {
        // Redirect to the login page if the user is not authenticated.
        header('Location: login.php');
        exit;
    }
}

/**
 * Validates user credentials against the database.
 *
 * @param PDO $pdo The database connection object.
 * @param string $email The user's email address.
 * @param string $password The user's plain-text password.
 * @return bool True on successful login, false otherwise.
 */
function login(PDO $pdo, string $email, string $password): bool {
    // Prepare a statement to fetch user by email.
    $stmt = $pdo->prepare('SELECT id, password_hash FROM users WHERE email = ?');
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    // Verify the password against the stored hash.
    if ($user && password_verify($password, $user['password_hash'])) {
        // On success, store user ID in the session.
        $_SESSION['user_id'] = (int)$user['id'];
        return true;
    }
    // Return false if user not found or password is incorrect.
    return false;
}

/**
 * Logs the current user out by destroying their session.
 */
function logout(): void {
    // Unset all session variables.
    $_SESSION = [];

    // Delete the session cookie.
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(
            session_name(),
            '',
            time() - 42000,
            $params["path"],
            $params["domain"],
            $params["secure"],
            $params["httponly"]
        );
    }

    // Finally, destroy the session.
    session_destroy();
}
