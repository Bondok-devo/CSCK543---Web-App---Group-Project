// File: public/assets/js/main.js
document.addEventListener("DOMContentLoaded", () => {
    
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

    // ========= RATING FORM AUTO-SUBMIT =========
    const ratingForm = document.getElementById('rating-form');
    if (ratingForm) {
        // Submit the form whenever a star (radio button) is changed
        ratingForm.addEventListener('change', () => {
            ratingForm.submit();
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
});
