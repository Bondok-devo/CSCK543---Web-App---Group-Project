document.addEventListener("DOMContentLoaded", () => {
    
    // ========= PREFERENCE TOGGLE =========
    const prefToggle = document.getElementById('pref-toggle');
    if (prefToggle) {
        const userPreferences = JSON.parse(prefToggle.dataset.preferences || '[]');
        const filterForm = document.getElementById('filter-form');
        const categoryCheckboxes = filterForm.querySelectorAll('input[name="categories[]"]');

        prefToggle.addEventListener('change', () => {
            categoryCheckboxes.forEach(checkbox => {
                checkbox.checked = false;
            });

            if (prefToggle.checked && userPreferences.length > 0) {
                userPreferences.forEach(prefId => {
                    const checkboxToSelect = filterForm.querySelector(`input[name="categories[]"][value="${prefId}"]`);
                    if (checkboxToSelect) {
                        checkboxToSelect.checked = true;
                    }
                });
            }
            
            if (window.innerWidth >= 900) {
                filterForm.submit();
            }
        });
    }

    // Auto-submit filter form on desktop only
    const filterForm = document.getElementById('filter-form');
    if (filterForm && window.innerWidth >= 900) {
        const submitButton = filterForm.querySelector('.mobile-only-submit');
        if (submitButton) {
            submitButton.style.display = 'none';
        }

        filterForm.addEventListener('change', (e) => {
            if (e.target.id !== 'pref-toggle') {
                setTimeout(() => {
                    filterForm.submit();
                }, 100);
            }
        });
    }

    // Remember collapsible category state
    const categoryDetails = document.getElementById('category-details');
    const categoryOpenInput = document.getElementById('category_open_input');
    if (categoryDetails && categoryOpenInput) {
        categoryDetails.addEventListener('toggle', () => {
            categoryOpenInput.value = categoryDetails.open ? '1' : '0';
        });
    }

    // ========= MOBILE FILTER OVERLAY =========
    const openFilterBtn = document.getElementById('open-filter-btn');
    const closeFilterBtn = document.getElementById('close-filter-btn');
    const filterSidebar = document.getElementById('filter-sidebar');
    if (openFilterBtn && closeFilterBtn && filterSidebar) {
        openFilterBtn.addEventListener('click', () => {
            filterSidebar.classList.add('open');
        });
        closeFilterBtn.addEventListener('click', () => {
            filterSidebar.classList.remove('open');
        });
    }

    // ========= USER DROPDOWN MENU (CORRECTED) =========
    const userMenu = document.querySelector(".user-menu");
    if (userMenu) {
        const userMenuButton = userMenu.querySelector(".user-menu-button");
        userMenuButton.addEventListener("click", (e) => {
            e.stopPropagation();
            
            // --- FIX: Toggle ARIA attribute on click ---
            const isExpanded = userMenuButton.getAttribute('aria-expanded') === 'true';
            userMenuButton.setAttribute('aria-expanded', !isExpanded);
            
            userMenu.classList.toggle("open");
        });

        document.addEventListener("click", (e) => {
            if (userMenu.classList.contains("open") && !userMenu.contains(e.target)) {
                userMenu.classList.remove("open");

                // --- FIX: Reset ARIA attribute when closing ---
                userMenuButton.setAttribute('aria-expanded', 'false');
            }
        });
    }
    
    // ========= MOBILE NAV TOGGLE =========
    const menuToggle = document.querySelector('.menu-toggle');
    const primaryNav = document.querySelector('.primary-navigation');
    if(menuToggle && primaryNav) {
        menuToggle.addEventListener('click', () => {
            const isExpanded = menuToggle.getAttribute('aria-expanded') === 'true';
            menuToggle.setAttribute('aria-expanded', !isExpanded);
            primaryNav.classList.toggle('open');
        });
    }

    // ========= SEARCH FORM VALIDATION =========
    const searchForm = document.querySelector(".search-bar");
    if (searchForm) {
        searchForm.addEventListener("submit", (e) => {
            const input = searchForm.querySelector("input[name='q']");
            if (input.value.trim() === "") {
                e.preventDefault();
                input.style.borderColor = 'red';
                input.placeholder = "Please enter a search term!";
            }
        });
    }
});