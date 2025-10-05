<?php
// File: public/results.php
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

// Sanitize all filter inputs from the URL
$search_term = trim($_GET['q'] ?? '');
$category_filters = isset($_GET['categories']) && is_array($_GET['categories']) ? array_filter($_GET['categories'], 'is_numeric') : [];
$difficulty_filter = trim($_GET['difficulty'] ?? '');
$rating_filter = filter_input(INPUT_GET, 'rating', FILTER_VALIDATE_INT, ['options' => ['min_range' => 0, 'max_range' => 4]]);

$params = [];
$where_clauses = [];
$having_clauses = [];

$sql = "
    SELECT 
        r.id, r.title, r.summary, r.cook_time, r.image_url, r.difficulty,
        (SELECT AVG(overall) FROM ratings WHERE recipe_id = r.id) as avg_rating
    FROM recipes r
    LEFT JOIN recipe_categories rc ON r.id = rc.recipe_id
    LEFT JOIN recipe_ingredients ri ON r.id = ri.recipe_id
    LEFT JOIN ingredients i ON ri.ingredient_id = i.id
";

// WHERE clause for search term
if (!empty($search_term)) {
    $where_clauses[] = "(MATCH(r.title, r.summary) AGAINST(? IN NATURAL LANGUAGE MODE) OR i.name LIKE ?)";
    $params[] = $search_term;
    $params[] = '%' . $search_term . '%';
}

// WHERE clause for difficulty
if (!empty($difficulty_filter) && in_array($difficulty_filter, ['Easy', 'Medium', 'Hard'])) {
    $where_clauses[] = "r.difficulty = ?";
    $params[] = $difficulty_filter;
}

// WHERE clause for categories (finds recipes in ANY of the selected categories)
if (!empty($category_filters)) {
    $placeholders = implode(',', array_fill(0, count($category_filters), '?'));
    $where_clauses[] = "rc.category_id IN ($placeholders)";
    foreach ($category_filters as $cat_id) {
        $params[] = (int)$cat_id;
    }
}

// HAVING clause for rating
if ($rating_filter > 0) {
    $having_clauses[] = "avg_rating >= ?";
    $params[] = $rating_filter;
}

// Add WHERE clauses to SQL
if (!empty($where_clauses)) {
    $sql .= " WHERE " . implode(' AND ', $where_clauses);
}

// Always group by recipe ID to avoid duplicates
$sql .= " GROUP BY r.id";

// Add HAVING clauses to SQL
if (!empty($having_clauses)) {
    $sql .= " HAVING " . implode(' AND ', $having_clauses);
}

$sql .= " ORDER BY r.title";

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$results = $stmt->fetchAll();
?>

<div class="main-layout">
    <?php require_once __DIR__ . '/../src/includes/sidebar.php'; ?>
    
    <div class="content-area">
        <section class="search-header">
            <h2>Search Results</h2>
            <form action="results.php" method="get" class="search-bar">
                <input type="text" name="q" value="<?= e($search_term) ?>" placeholder="Search for recipes, ingredients...">
                <button type="submit">Search</button>
            </form>
        </section>

        <?php if ($results): ?>
            <div class="recipe-grid">
            <?php foreach ($results as $recipe): ?>
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
        <?php else: ?>
            <p>No recipes found matching your criteria. Try adjusting your search or filters.</p>
        <?php endif; ?>
    </div>
</div>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
