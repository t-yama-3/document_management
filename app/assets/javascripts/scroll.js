document.addEventListener("turbolinks:load", function() {
  if (document.getElementById('details_scroll') != null) {
    document.getElementById('details_scroll').addEventListener('click', function(e) {
      e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
      e.stopPropagation();  // 現在のイベントのさらなる伝播（DELETEメソッドの実行）を止める
      window.scroll(0, 600);
    })
  }
})
