
document.addEventListener('DOMContentLoaded', function() {
    const searchIcon = document.querySelector('.img-search');
    const searchOverlay = document.querySelector('.search-overlay');
    const closeBtn = document.querySelector('.close-btn');
    const searchInput = document.querySelector('.search-input');
    const liAnimation = document.querySelector('#li');
    const searchBox = document.getElementById("select-box");
    
    searchIcon.addEventListener('click', function(e) {
        e.preventDefault();
        liAnimation.classList.add('li');
        liAnimation.classList.remove('backLi');
        searchBox.classList.remove("backBox")
        searchBox.classList.add("box");
        
    });

    closeBtn.addEventListener('click', function() {
        searchBox.classList.remove("box")
        liAnimation.classList.remove('li');
        liAnimation.classList.add('backLi');
        searchBox.classList.add("backBox")
    });

    
    document.addEventListener('keydown', function(e) {
        if(e.key === 'Escape') {
            liAnimation.classList.remove('li');
            liAnimation.classList.add('backLi');
            searchBox.classList.add("backBox")
            searchBox.classList.remove("box")
        }
    });
});

document.addEventListener('DOMContentLoaded', function(){
    const search = document.getElementById("system-search");
    const searchBox = document.getElementById("select-box");
    search.addEventListener("click" , function(){
    
        searchBox.classList.add("box");
    })

})