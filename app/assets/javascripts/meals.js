$(document).ready (function() {
  $('.item-cat').click(function () {
    $(this).children('.extra').fadeToggle("slow");
  });
});