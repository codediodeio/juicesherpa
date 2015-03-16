// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {

  $(document).on("upload:start", "form", function(e) {
    $(".upload-start").show();
  });

  $(document).on("upload:progress", "form", function(e) {
    $(".upload-progress")
  });

  $(document).on("upload:success", "form", function(e) {
    $(".upload-start").hide();
    $(".upload-success").show();
  });

});
