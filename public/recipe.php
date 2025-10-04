<?php
// File: public/recipe.php
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';
require_once __DIR__ . '/../src/includes/csrf.php';

$recipe_id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
$user_id = current_user_id();
if (!$recipe_id) {
    showErrorPage("Invalid Recipe ID provided.");
    exit;
}
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $user_id) {
    verify_csrf();
    $action = $_POST['action'] ?? '';
    if ($action === 'toggle_favourite') {
        $fav_stmt = $pdo->prepare("SELECT COUNT(*) FROM favourites WHERE user_id = ? AND recipe_id = ?");
        $fav_stmt->execute([$user_id, $recipe_id]);
        $is_favourited = $fav_stmt->fetchColumn() > 0;
        if ($is_favourited) {
            $stmt = $pdo->prepare("DELETE FROM favourites WHERE user_id = ? AND recipe_id = ?");
            $_SESSION['toast_message'] = 'Recipe removed from your favourites.';
        } else {
            $stmt = $pdo->prepare("INSERT INTO favourites (user_id, recipe_id) VALUES (?, ?)");
            $_SESSION['toast_message'] = 'Recipe added to your favourites!';
        }
        $stmt->execute([$user_id, $recipe_id]);
    } elseif ($action === 'rate') {
        $rating = filter_input(INPUT_POST, 'rating', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1, 'max_range' => 5]]);
        if ($rating) {
            $sql = "INSERT INTO ratings (user_id, recipe_id, overall) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE overall = VALUES(overall)";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$user_id, $recipe_id, $rating]);
            $_SESSION['toast_message'] = 'Thank you for your rating!';
        } else {
            $_SESSION['toast_message'] = 'Invalid rating provided.';
        }
    }
    header("Location: recipe.php?id=$recipe_id");
    exit;
}
$is_favourited = false;
if ($user_id) {
    $fav_stmt = $pdo->prepare("SELECT COUNT(*) FROM favourites WHERE user_id = ? AND recipe_id = ?");
    $fav_stmt->execute([$user_id, $recipe_id]);
    $is_favourited = $fav_stmt->fetchColumn() > 0;
}
$user_rating = null;
if ($user_id) {
    $user_rating_stmt = $pdo->prepare("SELECT overall FROM ratings WHERE user_id = ? AND recipe_id = ?");
    $user_rating_stmt->execute([$user_id, $recipe_id]);
    $user_rating = $user_rating_stmt->fetchColumn();
}
$stmt = $pdo->prepare("SELECT * FROM recipes WHERE id = ?");
$stmt->execute([$recipe_id]);
$recipe = $stmt->fetch();
if (!$recipe) { showErrorPage("Recipe Not Found."); exit; }
$cat_stmt = $pdo->prepare("SELECT c.name FROM recipe_categories rc JOIN categories c ON rc.category_id = c.id WHERE rc.recipe_id = ?");
$cat_stmt->execute([$recipe_id]);
$categories = $cat_stmt->fetchAll(PDO::FETCH_COLUMN);
$ing_stmt = $pdo->prepare("SELECT i.name, ri.quantity_text FROM recipe_ingredients ri JOIN ingredients i ON ri.ingredient_id = i.id WHERE ri.recipe_id = ?");
$ing_stmt->execute([$recipe_id]);
$ingredients = $ing_stmt->fetchAll();
$steps_stmt = $pdo->prepare("SELECT instruction FROM recipe_steps WHERE recipe_id = ? ORDER BY step_no");
$steps_stmt->execute([$recipe_id]);
$steps = $steps_stmt->fetchAll(PDO::FETCH_COLUMN);
$rating_stmt = $pdo->prepare("SELECT AVG(overall) as avg_rating, COUNT(*) as rating_count FROM ratings WHERE recipe_id = ?");
$rating_stmt->execute([$recipe_id]);
$rating_info = $rating_stmt->fetch();
$toast_message = $_SESSION['toast_message'] ?? null;
unset($_SESSION['toast_message']);
?>
<div class="container">
    <?php if ($toast_message): ?>
        <div class="alert alert-success" style="margin-bottom: 1rem;"><?= e($toast_message) ?></div>
    <?php endif; ?>
    <article class="recipe-detail">
        <?php if (!empty($recipe['image_url'])): ?>
            <!-- This now uses the full-resolution image and has no width/height attributes -->
            <img src="<?= e($base_url . '/public' . $recipe['image_url']) ?>" alt="<?= e($recipe['title']) ?>" class="recipe-detail-image">
        <?php endif; ?>
        <div class="recipe-header">
            <h2><?= e($recipe['title']) ?></h2>
            <?php if ($user_id): ?>
                <form action="recipe.php?id=<?= $recipe_id ?>" method="post" class="favourite-form-top">
                    <?= csrf_field() ?>
                    <input type="hidden" name="action" value="toggle_favourite">
                    <button type="submit" class="favourite-button <?= $is_favourited ? 'favourited' : '' ?>">
                        <svg class="heart-icon" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
                        <span><?= $is_favourited ? 'Saved' : 'Save Recipe' ?></span>
                    </button>
                </form>
            <?php endif; ?>
        </div>
        <p><?= e($recipe['summary']) ?></p>
        <div class="recipe-meta">
            <p><strong>Difficulty:</strong> <?= e($recipe['difficulty']) ?></p>
            <p><strong>Prep time:</strong> <?= e($recipe['prep_time']) ?></p>
            <p><strong>Cook time:</strong> <?= e($recipe['cook_time']) ?></p>
            <?php if ($categories): ?>
                <p><strong>Categories:</strong> <?= e(implode(', ', $categories)) ?></p>
            <?php endif; ?>
            <?php if ($rating_info && $rating_info['rating_count'] > 0): ?>
                <p><strong>Rating:</strong> <?= number_format((float)$rating_info['avg_rating'], 1) ?> / 5 (from <?= $rating_info['rating_count'] ?> review(s))</p>
            <?php else: ?>
                <p><strong>Rating:</strong> Not yet rated.</p>
            <?php endif; ?>
        </div>
        <h3>Ingredients</h3>
        <ul>
            <?php foreach ($ingredients as $ing): ?>
                <li><?= e($ing['quantity_text']) ?> <?= e($ing['name']) ?></li>
            <?php endforeach; ?>
        </ul>
        <h3>Steps</h3>
        <ol>
            <?php foreach ($steps as $step): ?>
                <li><?= e($step) ?></li>
            <?php endforeach; ?>
        </ol>
        <div class="recipe-actions">
             <?php if ($user_id): ?>
                <div class="rating-widget">
                    <h3>Your Rating</h3>
                    <form id="rating-form" class="rating-form" action="recipe.php?id=<?= $recipe_id ?>" method="post">
                         <?= csrf_field() ?>
                        <input type="hidden" name="action" value="rate">
                        <div class="star-rating">
                            <input type="radio" id="star5" name="rating" value="5" <?= ($user_rating == 5) ? 'checked' : '' ?> /><label for="star5" title="5 stars">★</label>
                            <input type="radio" id="star4" name="rating" value="4" <?= ($user_rating == 4) ? 'checked' : '' ?> /><label for="star4" title="4 stars">★</label>
                            <input type="radio" id="star3" name="rating" value="3" <?= ($user_rating == 3) ? 'checked' : '' ?> /><label for="star3" title="3 stars">★</label>
                            <input type="radio" id="star2" name="rating" value="2" <?= ($user_rating == 2) ? 'checked' : '' ?> /><label for="star2" title="2 stars">★</label>
                            <input type="radio" id="star1" name="rating" value="1" <?= ($user_rating == 1) ? 'checked' : '' ?> /><label for="star1" title="1 star">★</label>
                        </div>
                    </form>
                </div>
            <?php else: ?>
                <p><a href="login.php">Log in</a> to rate this recipe or save it to your favourites.</p>
            <?php endif; ?>
        </div>
    </article>
</div>
<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
