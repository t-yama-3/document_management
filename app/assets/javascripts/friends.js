$(document).on('turbolinks:load', ()=> {
  if ($('#user_confirm') == null) { return; }
  // 区分の選択を行った場合の処理
  console.log('ttt');
  $('#user_confirm').on('click', function(e) {
    let result = confirm('test');
    if (result == false) {
      e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
      // e.stopPropagation();  // 現在のイベントのさらなる伝播（DELETEメソッドの実行）を止める
    }
  });
});
