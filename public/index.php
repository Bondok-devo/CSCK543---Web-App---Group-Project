<?php
// File: public/index.php
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

$featured_stmt = $pdo->query("SELECT id, title, summary, cook_time, image_url FROM recipes ORDER BY RAND() LIMIT 3");
$featured_recipes = $featured_stmt->fetchAll();

$all_recipes_stmt = $pdo->query("SELECT id, title, summary, cook_time, image_url FROM recipes ORDER BY title ASC");
$all_recipes = $all_recipes_stmt->fetchAll();
?>
<section class="hero">
    <h2>Discover Delicious Recipes</h2>
    <form action="results.php" method="get" class="search-bar">
        <input type="text" name="q" placeholder="Search for recipes, ingredients...">
        <button type="submit">Search</button>
    </form>
</section>
<div class="main-layout">
    <?php require_once __DIR__ . '/../src/includes/sidebar.php'; ?>
    <div class="content-area">
        <section class="featured">
            <h2>Featured Recipes</h2>
            <div class="recipe-grid">
                <?php foreach ($featured_recipes as $recipe): ?>
                    <article class="recipe-card">
                        <?php if (!empty($recipe['image_url'])):
                            $thumb_url = str_replace('.jpg', '_thumb.jpg', $recipe['image_url']);
                        ?>
                            <img src="<?= e($base_url . '/public' . $thumb_url) ?>" alt="<?= e($recipe['title']) ?>" class="recipe-card-image" width="400" height="225" fetchpriority="high">
                        <?php endif; ?>
                        <div class="recipe-card-content">
                            <h3><?= e($recipe['title']) ?></h3>
                            <p><?= e(substr($recipe['summary'] ?? '', 0, 80)) ?>...</p>
                            <p class="recipe-card-time"><strong>Cook time:</strong> <?= e($recipe['cook_time']) ?></p>
                            <a href="recipe.php?id=<?= e((string)$recipe['id']) ?>" class="button-link">View Recipe</a>
                        </div>
                    </article>
                <?php endforeach; ?>
            </div>
        </section>
        <section class="all-recipes">
            <h2 class="section-title-spacing">All Recipes</h2>
            <div class="recipe-grid">
                <?php foreach ($all_recipes as $recipe): ?>
                    <article class="recipe-card">
                        <?php if (!empty($recipe['image_url'])):
                            $thumb_url = str_replace('.jpg', '_thumb.jpg', $recipe['image_url']);
                        ?>
                            <img src="<?= e($base_url . '/public' . $thumb_url) ?>" alt="<?= e($recipe['title']) ?>" class="recipe-card-image" loading="lazy" width="400" height="225">
                        <?php endif; ?>
                        <div class="recipe-card-content">
                            <h3><?= e($recipe['title']) ?></h3>
                            <p><?= e(substr($recipe['summary'] ?? '', 0, 80)) ?>...</p>
                            <p class="recipe-card-time"><strong>Cook time:</strong> <?= e($recipe['cook_time']) ?></p>
                            <a href="recipe.php?id=<?= e((string)$recipe['id']) ?>" class="button-link">View Recipe</a>
                        </div>
                    </article>
                <?php endforeach; ?>
            </div>
        </section>
    </div>
</div>
<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
