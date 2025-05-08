
document.addEventListener('DOMContentLoaded', function() {
    const searchIcon = document.querySelector('.img-search');
    const searchOverlay = document.querySelector('.search-overlay');
    const closeBtn = document.querySelector('.close-btn');
    const searchInput = document.querySelector('.search-input');
    const liAnimation = document.querySelector('#li');

  
    searchIcon.addEventListener('click', function(e) {
        e.preventDefault();
        liAnimation.classList.add('li');
        liAnimation.classList.remove('backLi');
        searchOverlay.classList.add('active');
        searchInput.focus();
    });

   
    closeBtn.addEventListener('click', function() {
        liAnimation.classList.remove('li');
        liAnimation.classList.add('backLi');
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



document.addEventListener('DOMContentLoaded', function(){
    const search = document.getElementById("system-search")




    search.addEventListener("click" , function(){

        console.log("odk");
        

    })




})