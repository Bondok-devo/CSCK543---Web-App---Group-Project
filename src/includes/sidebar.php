<?php
// File: src/includes/sidebar.php
$user_id = current_user_id();
$user_preferences = [];

if ($user_id) {
    try {
        $pref_stmt = $pdo->prepare("SELECT category_id FROM user_preferences WHERE user_id = ?");
        $pref_stmt->execute([$user_id]);
        $user_preferences = $pref_stmt->fetchAll(PDO::FETCH_COLUMN);
    } catch (PDOException $e) { /* Silently fail */ }
}

$applied_cat_filters = array_map('intval', $_GET['categories'] ?? []);
$applied_diff_filter = $_GET['difficulty'] ?? '';
$applied_rating_filter = $_GET['rating'] ?? 0;
$is_category_open = $_GET['category_open'] ?? 0;

$are_prefs_applied = false;
if (!empty($user_preferences) && !empty($applied_cat_filters)) {
    $sorted_prefs = $user_preferences;
    $sorted_applied = $applied_cat_filters;
    sort($sorted_prefs);
    sort($sorted_applied);
    if ($sorted_prefs === $sorted_applied) {
        $are_prefs_applied = true;
    }
}

try {
    $cat_stmt = $pdo->query("SELECT id, name FROM categories ORDER BY name");
    $all_categories = $cat_stmt->fetchAll();
} catch (PDOException $e) {
    $all_categories = [];
}
?>

<div class="mobile-filter-trigger">
    <button id="open-filter-btn" class="button button-secondary" aria-haspopup="dialog">Filter Recipes</button>
</div>

<aside class="sidebar" id="filter-sidebar" role="dialog" aria-modal="true" aria-labelledby="filter-sidebar-heading">
    <div class="sidebar-widget">
        <div class="sidebar-header">
            <h3 id="filter-sidebar-heading">Filter Recipes</h3>
            <button id="close-filter-btn" class="close-btn" aria-label="Close filters">&times;</button>
        </div>
        
        <form id="filter-form" action="results.php" method="get">
            <input type="hidden" name="q" value="<?= e($_GET['q'] ?? '') ?>">
            <input type="hidden" name="filters_submitted" value="1">
            <input type="hidden" id="category_open_input" name="category_open" value="<?= e((string)$is_category_open) ?>">

            <div class="filter-group">
                <a href="results.php" class="all-recipes-link">View All Recipes</a>
            </div>
            
            <?php if ($user_id && !empty($user_preferences)): ?>
            <div class="filter-group preference-toggle-container">
                <label for="pref-toggle">Apply My Preferences</label>
                <label class="switch">
                    <input type="checkbox" id="pref-toggle" data-preferences='<?= json_encode($user_preferences) ?>' <?= $are_prefs_applied ? 'checked' : '' ?>>
                    <span class="slider"></span>
                </label>
            </div>
            <?php endif; ?>

            <div class="filter-group">
                <h3>Difficulty</h3>
                <div class="radio-filter-group">
                    <input type="radio" id="diff_any" name="difficulty" value="" <?= empty($applied_diff_filter) ? 'checked' : '' ?>>
                    <label for="diff_any">Any</label>
                    <input type="radio" id="diff_easy" name="difficulty" value="Easy" <?= $applied_diff_filter == 'Easy' ? 'checked' : '' ?>>
                    <label for="diff_easy">Easy</label>
                    <input type="radio" id="diff_medium" name="difficulty" value="Medium" <?= $applied_diff_filter == 'Medium' ? 'checked' : '' ?>>
                    <label for="diff_medium">Medium</label>
                    <input type="radio" id="diff_hard" name="difficulty" value="Hard" <?= $applied_diff_filter == 'Hard' ? 'checked' : '' ?>>
                    <label for="diff_hard">Hard</label>
                </div>
            </div>
            
            <div class="filter-group">
                <h3>Minimum Rating</h3>
                <div class="radio-filter-group">
                    <input type="radio" id="rating_any" name="rating" value="0" <?= empty($applied_rating_filter) ? 'checked' : '' ?>>
                    <label for="rating_any">Any</label>
                    <input type="radio" id="rating_4" name="rating" value="4" <?= $applied_rating_filter == 4 ? 'checked' : '' ?>>
                    <label for="rating_4">4+</label>
                    <input type="radio" id="rating_3" name="rating" value="3" <?= $applied_rating_filter == 3 ? 'checked' : '' ?>>
                    <label for="rating_3">3+</label>
                    <input type="radio" id="rating_2" name="rating" value="2" <?= $applied_rating_filter == 2 ? 'checked' : '' ?>>
                    <label for="rating_2">2+</label>
                </div>
            </div>
            
            <details id="category-details" class="filter-group" <?= $is_category_open ? 'open' : '' ?>>
                <summary><h3>Category</h3></summary>
                <?php foreach ($all_categories as $category): ?>
                    <div class="filter-option">
                        <input type="checkbox" name="categories[]" value="<?= e((string)$category['id']) ?>" id="cat-<?= e((string)$category['id']) ?>" <?= in_array($category['id'], $applied_cat_filters) ? 'checked' : '' ?>>
                        <label for="cat-<?= e((string)$category['id']) ?>"><?= e($category['name']) ?></label>
                    </div>
                <?php endforeach; ?>
            </details>
            
            <div class="mobile-only-submit">
                <button type="submit" class="button button-secondary">Apply Filters</button>
            </div>
        </form>
    </div>
</aside>
