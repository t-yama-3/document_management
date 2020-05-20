$(document).on('turbolinks:load', function() {
  // ハンバーガーメニューをクリックした場合の処理
  $('#three_bar').on('click', function(e){
    if ($('#hidden_menu').is(':hidden')) {
      $('#hidden_menu').slideDown();
    } else {
      $('#hidden_menu').slideUp();
    }
  })
  
  // ウィンドウ幅が700pxを超えた場合はスライドメニューを隠す
  $(window).resize(function(){
    let width = $(window).width();
    if (width >= 700) {
      $('#hidden_menu').hide();
    }
  });  
})