$(document).on('turbolinks:load', ()=> {
  $("#details_scroll").on("click", function(e){
    e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
    e.stopPropagation();  // 現在のイベントのさらなる伝播（DELETEメソッドの実行）を止める
    scrollTo(0, 600);
  })
})