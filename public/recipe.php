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
        $taste = filter_input(INPUT_POST, 'taste', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1, 'max_range' => 5]]);
        $aesthetics = filter_input(INPUT_POST, 'aesthetics', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1, 'max_range' => 5]]);
        $difficulty_score = filter_input(INPUT_POST, 'difficulty_score', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1, 'max_range' => 5]]);
        if ($taste && $aesthetics && $difficulty_score) {
            $overall = round(($taste + $aesthetics) / 2);
            $sql = "INSERT INTO ratings (user_id, recipe_id, taste, aesthetics, difficulty_score, overall) VALUES (?, ?, ?, ?, ?, ?)
                    ON DUPLICATE KEY UPDATE taste = VALUES(taste), aesthetics = VALUES(aesthetics), difficulty_score = VALUES(difficulty_score), overall = VALUES(overall)";
            $stmt = $pdo->prepare($sql);
            $stmt->execute([$user_id, $recipe_id, $taste, $aesthetics, $difficulty_score, $overall]);
            $_SESSION['toast_message'] = 'Thank you for your rating!';
        } else {
            $_SESSION['toast_message'] = 'Please rate all three categories.';
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
    $user_rating_stmt = $pdo->prepare("SELECT taste, aesthetics, difficulty_score FROM ratings WHERE user_id = ? AND recipe_id = ?");
    $user_rating_stmt->execute([$user_id, $recipe_id]);
    $user_rating = $user_rating_stmt->fetch();
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
$steps_stmt = $pdo->prepare("SELECT instruction, minutes FROM recipe_steps WHERE recipe_id = ? ORDER BY step_no");
$steps_stmt->execute([$recipe_id]);
$steps = $steps_stmt->fetchAll();
$rating_stmt = $pdo->prepare("SELECT AVG(overall) as avg_overall, AVG(taste) as avg_taste, AVG(aesthetics) as avg_aesthetics, AVG(difficulty_score) as avg_difficulty, COUNT(*) as rating_count FROM ratings WHERE recipe_id = ?");
$rating_stmt->execute([$recipe_id]);
$public_ratings = $rating_stmt->fetch();
$toast_message = $_SESSION['toast_message'] ?? null;
unset($_SESSION['toast_message']);
?>
<div class="container">
    <?php if ($toast_message): ?>
        <div class="alert alert-success" style="margin-bottom: 1rem;"><?= e($toast_message) ?></div>
    <?php endif; ?>
    <article class="recipe-detail">
        <?php if (!empty($recipe['image_url'])): ?>
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
        </div>
        <h3>Ingredients</h3>
        <ul>
            <?php foreach ($ingredients as $ing): ?>
                <li><?= e($ing['quantity_text']) ?> <?= e($ing['name']) ?></li>
            <?php endforeach; ?>
        </ul>
        <h3>Steps</h3>
        <ol class="steps-list">
            <?php foreach ($steps as $step): ?>
                <li>
                    <p><?= e($step['instruction']) ?></p>
                    <?php if (!empty($step['minutes']) && $step['minutes'] > 0): ?>
                        <span class="step-time"><?= e((string)$step['minutes']) ?> mins</span>
                    <?php endif; ?>
                </li>
            <?php endforeach; ?>
        </ol>
        <div class="public-ratings-display">
            <h3>Public Ratings</h3>
            <?php if ($public_ratings && $public_ratings['rating_count'] > 0): ?>
                <p>Based on <?= e((string)$public_ratings['rating_count']) ?> review(s)</p>
                <div class="rating-breakdown">
                    <div class="rating-item">
                        <span class="rating-label">Overall</span>
                        <div class="rating-bar-container"><div class="rating-bar" style="width: <?= e((string)(($public_ratings['avg_overall'] / 5) * 100)) ?>%;"></div></div>
                        <span class="rating-score"><?= number_format((float)$public_ratings['avg_overall'], 1) ?>/5</span>
                    </div>
                    <div class="rating-item">
                        <span class="rating-label">Taste</span>
                        <div class="rating-bar-container"><div class="rating-bar" style="width: <?= e((string)(($public_ratings['avg_taste'] / 5) * 100)) ?>%;"></div></div>
                        <span class="rating-score"><?= number_format((float)$public_ratings['avg_taste'], 1) ?>/5</span>
                    </div>
                    <div class="rating-item">
                        <span class="rating-label">Aesthetics</span>
                        <div class="rating-bar-container"><div class="rating-bar" style="width: <?= e((string)(($public_ratings['avg_aesthetics'] / 5) * 100)) ?>%;"></div></div>
                        <span class="rating-score"><?= number_format((float)$public_ratings['avg_aesthetics'], 1) ?>/5</span>
                    </div>
                    <div class="rating-item">
                        <span class="rating-label">Difficulty</span>
                        <div class="rating-bar-container"><div class="rating-bar" style="width: <?= e((string)(($public_ratings['avg_difficulty'] / 5) * 100)) ?>%;"></div></div>
                        <span class="rating-score"><?= number_format((float)$public_ratings['avg_difficulty'], 1) ?>/5</span>
                    </div>
                </div>
            <?php else: ?>
                <p>This recipe has not been rated yet.</p>
            <?php endif; ?>
        </div>
        <div class="recipe-actions">
             <?php if ($user_id): ?>
                <div class="rating-widget-multi">
                    <h3>Your Rating</h3>
                    <form id="rating-form" class="rating-form-multi" action="recipe.php?id=<?= $recipe_id ?>" method="post">
                        <?= csrf_field() ?>
                        <input type="hidden" name="action" value="rate">
                        <div class="rating-group">
                            <label class="rating-label">Taste</label>
                            <div class="star-rating">
                                <input type="radio" id="taste5" name="taste" value="5" <?= ($user_rating['taste'] ?? 0) == 5 ? 'checked' : '' ?> required /><label for="taste5" title="5 stars">★</label>
                                <input type="radio" id="taste4" name="taste" value="4" <?= ($user_rating['taste'] ?? 0) == 4 ? 'checked' : '' ?> /><label for="taste4" title="4 stars">★</label>
                                <input type="radio" id="taste3" name="taste" value="3" <?= ($user_rating['taste'] ?? 0) == 3 ? 'checked' : '' ?> /><label for="taste3" title="3 stars">★</label>
                                <input type="radio" id="taste2" name="taste" value="2" <?= ($user_rating['taste'] ?? 0) == 2 ? 'checked' : '' ?> /><label for="taste2" title="2 stars">★</label>
                                <input type="radio" id="taste1" name="taste" value="1" <?= ($user_rating['taste'] ?? 0) == 1 ? 'checked' : '' ?> /><label for="taste1" title="1 star">★</label>
                            </div>
                        </div>
                        <div class="rating-group">
                             <label class="rating-label">Aesthetics</label>
                            <div class="star-rating">
                                <input type="radio" id="aes5" name="aesthetics" value="5" <?= ($user_rating['aesthetics'] ?? 0) == 5 ? 'checked' : '' ?> required /><label for="aes5" title="5 stars">★</label>
                                <input type="radio" id="aes4" name="aesthetics" value="4" <?= ($user_rating['aesthetics'] ?? 0) == 4 ? 'checked' : '' ?> /><label for="aes4" title="4 stars">★</label>
                                <input type="radio" id="aes3" name="aesthetics" value="3" <?= ($user_rating['aesthetics'] ?? 0) == 3 ? 'checked' : '' ?> /><label for="aes3" title="3 stars">★</label>
                                <input type="radio" id="aes2" name="aesthetics" value="2" <?= ($user_rating['aesthetics'] ?? 0) == 2 ? 'checked' : '' ?> /><label for="aes2" title="2 stars">★</label>
                                <input type="radio" id="aes1" name="aesthetics" value="1" <?= ($user_rating['aesthetics'] ?? 0) == 1 ? 'checked' : '' ?> /><label for="aes1" title="1 star">★</label>
                            </div>
                        </div>
                        <div class="rating-group">
                             <label class="rating-label">Difficulty</label>
                            <div class="star-rating">
                                <input type="radio" id="diff5" name="difficulty_score" value="5" <?= ($user_rating['difficulty_score'] ?? 0) == 5 ? 'checked' : '' ?> required /><label for="diff5" title="5 - Very Hard">★</label>
                                <input type="radio" id="diff4" name="difficulty_score" value="4" <?= ($user_rating['difficulty_score'] ?? 0) == 4 ? 'checked' : '' ?> /><label for="diff4" title="4 - Hard">★</label>
                                <input type="radio" id="diff3" name="difficulty_score" value="3" <?= ($user_rating['difficulty_score'] ?? 0) == 3 ? 'checked' : '' ?> /><label for="diff3" title="3 - Medium">★</label>
                                <input type="radio" id="diff2" name="difficulty_score" value="2" <?= ($user_rating['difficulty_score'] ?? 0) == 2 ? 'checked' : '' ?> /><label for="diff2" title="2 - Easy">★</label>
                                <input type="radio" id="diff1" name="difficulty_score" value="1" <?= ($user_rating['difficulty_score'] ?? 0) == 1 ? 'checked' : '' ?> /><label for="diff1" title="1 - Very Easy">★</label>
                            </div>
                        </div>
                        <button type="submit" class="button button-primary">Submit Ratings</button>
                    </form>
                </div>
            <?php else: ?>
                <p><a href="login.php">Log in</a> to rate this recipe.</p>
            <?php endif; ?>
        </div>
    </article>
</div>
<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
