$(document).on('turbolinks:load', ()=> {
  if ($('#user_confirm') == null) { return; }
  // 
  $('#user_confirm_send').on('click', function(e) {
    let result = confirm('フレンド申請をしますか？');
    if (result == false) {
      e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
      // e.stopPropagation();  // 現在のイベントのさらなる伝播（DELETEメソッドの実行）を止める
    }
  });

  $('#user_confirm').on('click', function(e) {
    let result = confirm('受諾通知を送信しますか？');
    if (result == false) {
      e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
      // e.stopPropagation();  // 現在のイベントのさらなる伝播（DELETEメソッドの実行）を止める
    }
  });

  $('#user_confirm_refusal').on('click', function(e) {
    let result = confirm('申請を拒否しますか？');
    if (result == false) {
      e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
      // e.stopPropagation();  // 現在のイベントのさらなる伝播（DELETEメソッドの実行）を止める
    }
  });
});
