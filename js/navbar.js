
document.addEventListener('DOMContentLoaded', function() {
    const searchIcon = document.querySelector('.img-search');
    const searchOverlay = document.querySelector('.search-overlay');
    const closeBtn = document.querySelector('.close-btn');
    const searchInput = document.querySelector('.search-input');

  
    searchIcon.addEventListener('click', function(e) {
        e.preventDefault();
        searchOverlay.classList.add('active');
        searchInput.focus();
    });

   
    closeBtn.addEventListener('click', function() {
        searchOverlay.classList.remove('active');
    });

    
    searchOverlay.addEventListener('click', function(e) {
        if(e.target === this) {
            this.classList.remove('active');
        }
    });

    
    document.addEventListener('keydown', function(e) {
        if(e.key === 'Escape') {
            searchOverlay.classList.remove('active');
        }
    });
});