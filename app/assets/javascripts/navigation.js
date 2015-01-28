$( document ).ready(function() {

  $(".explore").on("click", function(){
    $(".nav-second").animate({ width:'toggle' },300)
    $(".nav-third").hide();
  });

  $(".user-menu").on("click", function(){
    $(".nav-third").animate({ width:'toggle' },300)
    $(".nav-second").hide();
  });


});
