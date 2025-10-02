<?php
/**
 * File: recipe.php
 * Purpose: Displays the full details of a single recipe and handles adding/removing from favourites.
 */
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

// Sanitize the recipe ID from the URL query string.
$recipe_id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
$user_id = current_user_id();

if (!$recipe_id) {
    showErrorPage("Invalid Recipe ID provided.");
    exit;
}

// Handle form submission for adding/removing favourites.
if ($_SERVER['REQUEST_METHOD'] === 'POST' && $user_id) {
    verify_csrf();
    $action = $_POST['action'] ?? '';

    // Action: Add to favourites
    if ($action === 'add') {
        // Prevent duplicate entries.
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM favourites WHERE user_id = ? AND recipe_id = ?");
        $stmt->execute([$user_id, $recipe_id]);
        if ($stmt->fetchColumn() == 0) {
            $insert_stmt = $pdo->prepare("INSERT INTO favourites (user_id, recipe_id) VALUES (?, ?)");
            $insert_stmt->execute([$user_id, $recipe_id]);
            $_SESSION['toast_message'] = 'Recipe added to your favourites!';
        }
    } 
    // Action: Remove from favourites
    elseif ($action === 'remove') {
        $delete_stmt = $pdo->prepare("DELETE FROM favourites WHERE user_id = ? AND recipe_id = ?");
        $delete_stmt->execute([$user_id, $recipe_id]);
        $_SESSION['toast_message'] = 'Recipe removed from your favourites.';
    }

    // Redirect to the same page to prevent form resubmission on refresh.
    header("Location: recipe.php?id=$recipe_id");
    exit;
}


// Check if the current user has already favourited this recipe.
$is_favourited = false;
if ($user_id) {
    $fav_stmt = $pdo->prepare("SELECT COUNT(*) FROM favourites WHERE user_id = ? AND recipe_id = ?");
    $fav_stmt->execute([$user_id, $recipe_id]);
    if ($fav_stmt->fetchColumn() > 0) {
        $is_favourited = true;
    }
}

// Fetch the main details for the selected recipe.
$stmt = $pdo->prepare("SELECT * FROM recipes WHERE id = ?");
$stmt->execute([$recipe_id]);
$recipe = $stmt->fetch();

if (!$recipe) {
    showErrorPage("Recipe Not Found.");
    exit;
}

// Fetch ingredients and steps as before.
$ing_stmt = $pdo->prepare("SELECT i.name, ri.quantity_text FROM recipe_ingredients ri JOIN ingredients i ON ri.ingredient_id = i.id WHERE ri.recipe_id = ? ORDER BY ri.display_order, ri.ingredient_group");
$ing_stmt->execute([$recipe_id]);
$ingredients = $ing_stmt->fetchAll();
$steps_stmt = $pdo->prepare("SELECT instruction, minutes FROM recipe_steps WHERE recipe_id = ? ORDER BY step_no");
$steps_stmt->execute([$recipe_id]);
$steps = $steps_stmt->fetchAll();
$total_time = array_sum(array_column($steps, 'minutes'));

// Display and then clear the toast message from the session.
$toast_message = $_SESSION['toast_message'] ?? null;
unset($_SESSION['toast_message']);
?>

<?php if ($toast_message): ?>
    <div class="alert alert-success"><?= e($toast_message) ?></div>
<?php endif; ?>

<article class="recipe-detail">
    <?php if (!empty($recipe['image_url'])): ?>
        <img src="<?= e($base_url . $recipe['image_url']) ?>" alt="<?= e($recipe['title']) ?>" class="recipe-detail-image">
    <?php endif; ?>
    
    <h2><?= e($recipe['title']) ?></h2>
    <p><?= e($recipe['summary']) ?></p>
    <p><strong>Difficulty:</strong> <?= e($recipe['difficulty']) ?></p>
    <p><strong>Cooking Time:</strong> <?= $total_time ?> mins</p>

    <h3>Ingredients</h3>
    <ul>
        <?php foreach ($ingredients as $ing): ?>
            <li><?= e($ing['quantity_text']) ?> <?= e($ing['name']) ?></li>
        <?php endforeach; ?>
    </ul>

    <h3>Steps</h3>
    <ol>
        <?php foreach ($steps as $step): ?>
            <li><?= e($step['instruction']) ?> (<?= e((string)$step['minutes']) ?> mins)</li>
        <?php endforeach; ?>
    </ol>

    <?php if ($user_id): // Show button only if user is logged in ?>
        <?php if ($is_favourited): ?>
            <form action="recipe.php?id=<?= $recipe_id ?>" method="post">
                <?= csrf_field() ?>
                <input type="hidden" name="action" value="remove">
                <button type="submit" class="button-remove">Remove from Favourites</button>
            </form>
        <?php else: ?>
            <form action="recipe.php?id=<?= $recipe_id ?>" method="post">
                <?= csrf_field() ?>
                <input type="hidden" name="action" value="add">
                <button type="submit" class="add-to-favourites">Save to Favourites</button>
            </form>
        <?php endif; ?>
    <?php endif; ?>
</article>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
