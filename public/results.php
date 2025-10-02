<?php
/**
 * File: results.php
 * Purpose: Displays the results of a user's search query.
 */
declare(strict_types=1);
require_once __DIR__ . '/../src/includes/header.php';

// Sanitize the search term from the URL query string.
$search_term = trim($_GET['q'] ?? '');
?>

<h2>Results for "<?= e($search_term) ?>"</h2>

<?php
if (empty($search_term)) {
    echo "<p>Please enter a search term on the homepage to find recipes.</p>";
} else {
    // This robust query joins recipes with ingredients and uses GROUP BY to ensure each recipe appears only once.
    // It searches against both the recipe's text and the names of its ingredients.
    $sql = "
        SELECT
            r.id,
            r.title,
            r.summary,
            r.image_url
        FROM
            recipes r
        LEFT JOIN
            recipe_ingredients ri ON r.id = ri.recipe_id
        LEFT JOIN
            ingredients i ON ri.ingredient_id = i.id
        WHERE
            -- Condition 1: Match against the recipe's title and summary using FULLTEXT search.
            MATCH(r.title, r.summary) AGAINST(? IN NATURAL LANGUAGE MODE)
            -- Condition 2: Match against the ingredient's name.
            OR i.name LIKE ?
        -- Group by the recipe ID to collapse all duplicates into a single result per recipe.
        GROUP BY
            r.id
        ORDER BY
            r.title
    ";
    
    $stmt = $pdo->prepare($sql);
    
    // Bind the search term for the ingredient 'LIKE' search with wildcards.
    $like_term = '%' . $search_term . '%';
    
    // The search term is bound twice, once for the FULLTEXT search and once for the LIKE search.
    $stmt->execute([$search_term, $like_term]);
    
    $results = $stmt->fetchAll();

    if ($results) {
        echo '<div class="recipe-grid">';
        foreach ($results as $recipe) {
            echo '<article class="recipe-card">';
            if (!empty($recipe['image_url'])) {
                echo '<img src="' . e($base_url . $recipe['image_url']) . '" alt="' . e($recipe['title']) . '" class="recipe-card-image">';
            }
            echo '<h3>' . e($recipe['title']) . '</h3>';
            echo '<p>' . e(substr($recipe['summary'] ?? '', 0, 100)) . '...</p>';
            echo '<a href="recipe.php?id=' . e((string)$recipe['id']) . '">View Recipe</a>';
            echo '</article>';
        }
        echo '</div>';
    } else {
        echo '<p>No recipes found matching your search for "' . e($search_term) . '".</p>';
    }
}
?>

<?php require_once __DIR__ . '/../src/includes/footer.php'; ?>
