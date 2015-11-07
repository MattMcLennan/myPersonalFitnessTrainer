$(function(){
  $('#ss_btn').click(function(){
    $('#ss_form').css('display', 'inline');
    $('#sl_form').css('display', 'none');
  });

  $('#sl_btn').click(function(){
    $('#sl_form').css('display', 'inline');
    $('#ss_form').css('display', 'none');
  });
});
