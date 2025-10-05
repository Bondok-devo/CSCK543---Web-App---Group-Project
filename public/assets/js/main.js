document.addEventListener("DOMContentLoaded", () => {
    
    // ========= COMBINED FILTER LOGIC (FIX) =========
    const filterForm = document.getElementById('filter-form');
    if (filterForm) {
        // --- Preference Toggle Logic ---
        const prefToggle = document.getElementById('pref-toggle');
        if (prefToggle) {
            const userPreferences = JSON.parse(prefToggle.dataset.preferences || '[]');
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
                
                // Submit the form to apply the preference changes
                filterForm.submit();
            });
        }

        // --- Auto-submit on other filter changes (Desktop only) ---
        if (window.innerWidth >= 900) {
            const submitButton = filterForm.querySelector('.mobile-only-submit');
            if (submitButton) {
                submitButton.style.display = 'none';
            }

            filterForm.addEventListener('change', (e) => {
                // IMPORTANT: Only submit if the change was NOT from the preference toggle
                if (e.target.id !== 'pref-toggle') {
                    // Short delay to allow UI to update before submitting
                    setTimeout(() => {
                        filterForm.submit();
                    }, 100);
                }
            });
        }
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

    // ========= USER DROPDOWN MENU =========
    const userMenu = document.querySelector(".user-menu");
    if (userMenu) {
        const userMenuButton = userMenu.querySelector(".user-menu-button");
        userMenuButton.addEventListener("click", (e) => {
            e.stopPropagation();
            userMenu.classList.toggle("open");
});
        document.addEventListener("click", (e) => {
            if (userMenu.classList.contains("open") && !userMenu.contains(e.target)) {
                userMenu.classList.remove("open");
            }
        });
    }
    
    // ========= MOBILE NAV TOGGLE =========
    const menuToggle = document.querySelector('.menu-toggle');
    const primaryNav = document.querySelector('.primary-navigation');
    if(menuToggle && primaryNav) {
        menuToggle.addEventListener('click', () => {
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
