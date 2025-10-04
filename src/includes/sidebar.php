<?php
// File: src/includes/sidebar.php

// Fetch categories, ordered logically for the sidebar
try {
    $cat_stmt = $pdo->query("
        SELECT id, name FROM categories 
        ORDER BY
            CASE
                WHEN name IN ('Main', 'Starter', 'Dessert', 'Side Dish', 'Brunch') THEN 1
                ELSE 2
            END, name
    ");
    $all_categories = $cat_stmt->fetchAll();
} catch (PDOException $e) {
    $all_categories = [];
}
$applied_filters = $_GET['categories'] ?? [];
?>

<!-- This button is only visible on mobile and triggers the filter overlay -->
<div class="mobile-filter-trigger">
    <button id="open-filter-btn" class="button button-secondary">Filter Recipes</button>
</div>

<!-- The sidebar is hidden on mobile and appears as an overlay when triggered -->
<aside class="sidebar" id="filter-sidebar">
    <div class="sidebar-widget">
        <div class="sidebar-header">
            <h3>Filter by Category</h3>
            <!-- Close button for the mobile overlay -->
            <button id="close-filter-btn" class="close-btn">&times;</button>
        </div>
        
        <a href="results.php" class="all-recipes-link">View All Recipes</a>
        
        <form id="filter-form" action="results.php" method="get">
            <input type="hidden" name="q" value="<?= e($_GET['q'] ?? '') ?>">
            
            <?php foreach ($all_categories as $category): ?>
            <div class="filter-option">
                <input 
                    type="checkbox" 
                    name="categories[]" 
                    value="<?= e((string)$category['id']) ?>" 
                    id="cat-<?= e((string)$category['id']) ?>"
                    <?php if (in_array($category['id'], $applied_filters)): ?>checked<?php endif; ?>
                >
                <label for="cat-<?= e((string)$category['id']) ?>"><?= e($category['name']) ?></label>
            </div>
            <?php endforeach; ?>
            <button type="submit" class="button button-secondary">Apply Filters</button>
        </form>
    </div>
</aside>
