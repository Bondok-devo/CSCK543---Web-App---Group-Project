<?php
/**
 * File: index.php
 * Purpose: The main landing page of the application.
 * Displays a search bar and a selection of featured recipes.
 */
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

// Fetch a few random recipes to feature on the homepage.
// Using ORDER BY RAND() is simple for small datasets but can be slow on large ones.
$stmt = $pdo->query("SELECT id, title, summary, image_url FROM recipes ORDER BY RAND() LIMIT 3");
$featured_recipes = $stmt->fetchAll();
?>

<section class="hero">
    <h2>Discover Delicious Recipes</h2>
    <form action="results.php" method="get" class="search-bar">
        <input type="text" name="q" placeholder="Search for recipes, ingredients..." required>
        <button type="submit">Search</button>
    </form>
</section>

<section class="featured">
    <h2>Featured Recipes</h2>
    <div class="recipe-grid">
        <?php if ($featured_recipes): ?>
            <?php foreach ($featured_recipes as $recipe): ?>
                <article class="recipe-card">
                    <!-- Basic image display, can be enhanced later -->
                    <?php if (!empty($recipe['image_url'])): ?>
                        <img src="<?= e($base_url . $recipe['image_url']) ?>" alt="<?= e($recipe['title']) ?>" class="recipe-card-image">
                    <?php endif; ?>
                    <h3><?= e($recipe['title']) ?></h3>
                    <p><?= e(substr($recipe['summary'] ?? '', 0, 100)) ?>...</p>
                    <a href="recipe.php?id=<?= e((string)$recipe['id']) ?>">View Recipe</a>
                </article>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No featured recipes to display right now.</p>
        <?php endif; ?>
    </div>
</section>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
