$( document ).ready(function() {

  $('.search-button').on("click", function(){
    $(".search").slideToggle( "fast", function() {
      // Animation complete.
    });
  });

  $('.close').on("click", function(){
    $(".search-button").slideUp( "fast", function() {
      // Animation complete.
    });
  });

  $(".dropdown").on("click", function(){
    $(".nav-second").slideToggle( "fast", function() {
      // Animation complete.
    });
  });

});
