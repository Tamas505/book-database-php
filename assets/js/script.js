document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.querySelector('.search-input');
    const bookItems = document.querySelectorAll('.book-item');

    if (searchInput) {
        searchInput.addEventListener('input', function () {
            const searchText = this.value.toLowerCase().trim();

            bookItems.forEach(function (item) {
                const itemText = item.textContent.toLowerCase();

                if (itemText.includes(searchText)) {
                    item.style.display = '';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    }
});