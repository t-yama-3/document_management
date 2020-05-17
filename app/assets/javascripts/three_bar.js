$(document).on('turbolinks:load', ()=> {
  $('#three_bar').on('click', function(e){
    if ($('#hidden_menu').is(':hidden')) {
      $('#hidden_menu').slideDown();
    } else {
      $('#hidden_menu').slideUp();
    }
  })
  $(window).resize(function(){
    let width = $(window).width();
    if (width >= 700) {
      $('#hidden_menu').hide();
    }
  });  
})