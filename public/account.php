<?php
// File: public/account.php
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

// This page requires a user to be logged in.
require_login();

// Fetch the current user's details.
$user_id = current_user_id();
$stmt = $pdo->prepare('SELECT name, email FROM users WHERE id = ?');
$stmt->execute([$user_id]);
$user = $stmt->fetch();

// Fetch the user's favourite recipes.
$stmt = $pdo->prepare('
    SELECT r.id, r.title, r.summary, r.image_url
    FROM favourites f
    JOIN recipes r ON f.recipe_id = r.id
    WHERE f.user_id = ?
    ORDER BY f.created_at DESC
');
$stmt->execute([$user_id]);
$favourites = $stmt->fetchAll();
?>

<div class="container">
    <section class="account-info">
        <h2>Welcome, <?= e($user['name']) ?></h2>
        <p><strong>Email:</strong> <?= e($user['email']) ?></p>
    </section>

    <section class="favourites">
        <h2 class="section-title-spacing">My Favourites</h2>
        <?php if ($favourites): ?>
            <div class="recipe-grid">
            <?php foreach ($favourites as $favourite): ?>
                <article class="recipe-card">
                    <?php if (!empty($favourite['image_url'])):
                        // Create and use the thumbnail path for performance
                        $thumb_url = str_replace('.jpg', '_thumb.jpg', $favourite['image_url']);
                    ?>
                        <img src="<?= e($base_url . '/public' . $thumb_url) ?>" alt="<?= e($favourite['title']) ?>" class="recipe-card-image" width="400" height="225" loading="lazy">
                    <?php endif; ?>
                    <div class="recipe-card-content">
                        <h3><?= e($favourite['title']) ?></h3>
                        <!-- Use the consistent button style -->
                        <a href="recipe.php?id=<?= e((string)$favourite['id']) ?>" class="button-link">View Recipe</a>
                    </div>
                </article>
            <?php endforeach; ?>
            </div>
        <?php else: ?>
            <p>You haven't saved any favourite recipes yet. Explore the site and save some recipes!</p>
        <?php endif; ?>
    </section>
</div>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
