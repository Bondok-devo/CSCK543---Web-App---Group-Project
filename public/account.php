<?php
// File: public/account.php
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';
require_once __DIR__ . '/../src/includes/csrf.php';

require_login();
$user_id = current_user_id();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'save_prefs') {
    verify_csrf();
    $preferences = $_POST['preferences'] ?? [];
    
    $del_stmt = $pdo->prepare("DELETE FROM user_preferences WHERE user_id = ?");
    $del_stmt->execute([$user_id]);
    
    if (!empty($preferences)) {
        $ins_stmt = $pdo->prepare("INSERT INTO user_preferences (user_id, category_id) VALUES (?, ?)");
        foreach ($preferences as $cat_id) {
            if (is_numeric($cat_id)) {
                $ins_stmt->execute([$user_id, (int)$cat_id]);
            }
        }
    }
    $_SESSION['toast_message'] = 'Your preferences have been saved!';
    header('Location: account.php');
    exit;
}

$stmt = $pdo->prepare('SELECT name, email FROM users WHERE id = ?');
$stmt->execute([$user_id]);
$user = $stmt->fetch();

$stmt = $pdo->prepare('
    SELECT r.id, r.title, r.summary, r.image_url 
    FROM favourites f 
    JOIN recipes r ON f.recipe_id = r.id 
    WHERE f.user_id = ?
');
$stmt->execute([$user_id]);
$favourites = $stmt->fetchAll();

$user_prefs_stmt = $pdo->prepare("SELECT category_id FROM user_preferences WHERE user_id = ?");
$user_prefs_stmt->execute([$user_id]);
$user_preferences = $user_prefs_stmt->fetchAll(PDO::FETCH_COLUMN);

$all_cats_stmt = $pdo->query("SELECT id, name FROM categories ORDER BY name");
$all_categories = $all_cats_stmt->fetchAll();

$toast_message = $_SESSION['toast_message'] ?? null;
unset($_SESSION['toast_message']);
?>
<div class="container">
    <?php if ($toast_message): ?>
        <div class="alert alert-success" style="margin-bottom: 1rem;"><?= e($toast_message) ?></div>
    <?php endif; ?>

    <section class="account-info">
        <h2>Welcome, <?= e($user['name']) ?></h2>
        <p><strong>Email:</strong> <?= e($user['email']) ?></p>
    </section>

    <section class="preferences">
        <h2 class="section-title-spacing">My Category Preferences</h2>
        <p>Select your default categories. These will be pre-selected on the homepage.</p>
        <form action="account.php" method="post">
            <?= csrf_field() ?>
            <input type="hidden" name="action" value="save_prefs">
            <div class="preferences-grid">
                <?php foreach ($all_categories as $category): ?>
                    <div class="preference-option">
                        <input type="checkbox" name="preferences[]" value="<?= e((string)$category['id']) ?>" id="pref-<?= e((string)$category['id']) ?>" <?= in_array($category['id'], $user_preferences) ? 'checked' : '' ?>>
                        <label for="pref-<?= e((string)$category['id']) ?>"><?= e($category['name']) ?></label>
                    </div>
                <?php endforeach; ?>
            </div>
            <button type="submit" class="button button-primary">Save Preferences</button>
        </form>
    </section>

    <section class="favourites">
        <h2 class="section-title-spacing">My Favourites</h2>
        <?php if ($favourites): ?>
            <div class="recipe-grid">
            <?php foreach ($favourites as $favourite): ?>
                <article class="recipe-card">
                    <?php if (!empty($favourite['image_url'])):
                        $thumb_url = str_replace('.jpg', '_thumb.jpg', $favourite['image_url']);
                    ?>
                        <img src="<?= e($base_url . '/public' . $thumb_url) ?>" alt="<?= e($favourite['title']) ?>" class="recipe-card-image" width="400" height="225" loading="lazy">
                    <?php endif; ?>
                    <div class="recipe-card-content">
                        <h3><?= e($favourite['title']) ?></h3>
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
