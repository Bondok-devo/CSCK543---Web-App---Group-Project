// ========= SEARCH FORM VALIDATION =========
document.addEventListener("DOMContentLoaded", () => {
    const searchForm = document.querySelector(".search-bar");
    if (searchForm) {
        searchForm.addEventListener("submit", (e) => {
            const input = searchForm.querySelector("input[name='q']");
            if (input.value.trim() === "") {
                e.preventDefault();
                alert("Please enter a search term!");
            }
        });
    }

    // ========= SAVE TO FAVOURITES BUTTON =========
    const favButton = document.querySelector(".recipe-detail button");
    if (favButton) {
        favButton.addEventListener("click", () => {
            alert("Recipe saved to favourites! (Demo)");
            // Later: Send AJAX request to PHP to save to DB
        });
    }

    // ========= MOBILE NAV TOGGLE =========
    const nav = document.querySelector("nav");
    const header = document.querySelector("header");

    // Create a mobile menu button
    if (nav && header) {
        const menuBtn = document.createElement("button");
        menuBtn.textContent = "☰ Menu";
        menuBtn.classList.add("menu-toggle");
        header.insertBefore(menuBtn, nav);

        menuBtn.addEventListener("click", () => {
            nav.classList.toggle("open");
        });
    }
});