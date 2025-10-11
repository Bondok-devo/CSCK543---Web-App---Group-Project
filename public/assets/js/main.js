document.addEventListener("DOMContentLoaded", () => {
    const filterForm = document.getElementById('filter-form');

    // ========= FILTER FORM LOGIC =========
    if (filterForm) {
        filterForm.addEventListener('change', (e) => {
            const target = e.target;

            if (target.type === 'checkbox') {
                if (target.id === 'pref-toggle') {
                    const prefToggle = target;
                    const userPreferences = JSON.parse(prefToggle.dataset.preferences || '[]');
                    const categoryCheckboxes = filterForm.querySelectorAll('input[name="categories[]"]');
                    
                    categoryCheckboxes.forEach(checkbox => checkbox.checked = false);

                    if (prefToggle.checked && userPreferences.length > 0) {
                        userPreferences.forEach(prefId => {
                            const checkbox = filterForm.querySelector(`input[name="categories[]"][value="${prefId}"]`);
                            if (checkbox) checkbox.checked = true;
                        });
                    }
                }
                if (window.innerWidth >= 900) {
                    filterForm.submit();
                }
            }
            
            if (target.type === 'radio' && target.dataset.group) {
                const groupName = target.dataset.group;
                
                const radiosInGroup = filterForm.querySelectorAll(`input[type="radio"][data-group="${groupName}"]`);
                radiosInGroup.forEach(radio => {
                    if (radio !== target) {
                        radio.checked = false;
                    }
                });

                radiosInGroup.forEach(radio => {
                    radio.name = (radio.checked) ? groupName : '';
                });

                if (window.innerWidth >= 900) {
                    filterForm.submit();
                }
            }
        });

        if (window.innerWidth >= 900) {
            const submitButton = filterForm.querySelector('.mobile-only-submit');
            if (submitButton) {
                submitButton.style.display = 'none';
            }
        }
    }

    // ========= COLLAPSIBLE CATEGORY STATE =========
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
            const isExpanded = userMenuButton.getAttribute('aria-expanded') === 'true';
            userMenuButton.setAttribute('aria-expanded', !isExpanded);
            userMenu.classList.toggle("open");
        });
        document.addEventListener("click", (e) => {
            if (userMenu.classList.contains("open") && !userMenu.contains(e.target)) {
                userMenu.classList.remove("open");
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

    // ========= STAR RATING KEYBOARD NAVIGATION =========
    const starRatings = document.querySelectorAll('.star-rating');
    starRatings.forEach(ratingWidget => {
        const radios = Array.from(ratingWidget.querySelectorAll('input[type="radio"]'));
        
        ratingWidget.addEventListener('keydown', (e) => {
            const currentIndex = radios.findIndex(radio => radio === document.activeElement);
            if (currentIndex === -1) return;

            let nextIndex = -1;

            if (e.key === 'ArrowRight') {
                e.preventDefault();
                nextIndex = Math.max(0, currentIndex - 1);
            } else if (e.key === 'ArrowLeft') {
                e.preventDefault();
                nextIndex = Math.min(radios.length - 1, currentIndex + 1);
            }

            if (nextIndex !== -1) {
                radios[nextIndex].focus();
                radios[nextIndex].checked = true;
            }
        });
    });
});
