<?php
/**
 * File: account.php
 * Purpose: Displays the logged-in user's account information and their favourite recipes.
 * This page is protected and requires a user to be logged in.
 */
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

// The require_login function from auth.php will redirect to login.php if not authenticated.
require_login();

// Fetch the current user's details for display.
$user_id = current_user_id();
$stmt = $pdo->prepare('SELECT name, email FROM users WHERE id = ?');
$stmt->execute([$user_id]);
$user = $stmt->fetch();

// Fetch the user's favourite recipes by joining the favourites and recipes tables.
$stmt = $pdo->prepare('
    SELECT r.id, r.title, r.image_url
    FROM favourites f
    JOIN recipes r ON f.recipe_id = r.id
    WHERE f.user_id = ?
    ORDER BY f.created_at DESC
');
$stmt->execute([$user_id]);
$favourites = $stmt->fetchAll();
?>

<section class="account-info">
    <h2>Welcome, <?= e($user['name']) ?></h2>
    <p>Email: <?= e($user['email']) ?></p>
</section>

<section class="favourites">
    <h2>My Favourites</h2>
    <?php if ($favourites): ?>
        <div class="recipe-grid">
        <?php foreach ($favourites as $favourite): ?>
            <article class="recipe-card">
                <?php if (!empty($favourite['image_url'])): ?>
                    <img src="<?= e($base_url . $favourite['image_url']) ?>" alt="<?= e($favourite['title']) ?>" class="recipe-card-image">
                <?php endif; ?>
                <h3><?= e($favourite['title']) ?></h3>
                <a href="recipe.php?id=<?= e((string)$favourite['id']) ?>">View Recipe</a>
            </article>
        <?php endforeach; ?>
        </div>
    <?php else: ?>
        <p>You haven't saved any favourite recipes yet. Find a recipe and save it!</p>
    <?php endif; ?>
</section>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
