// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("upload:start", "form", function(e) {
  $('.uploading').show();
});

$(document).on("upload:success", "form", function(e) {
  $('.complete').show();
  $('.uploading').hide();
});
