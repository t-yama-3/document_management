// hamlファイルにconfirmを書いた場合に重複表示されるため（turbolinksが影響か？）回避策としてjavascriptで処理
document.addEventListener("turbolinks:load", function() {
  if (document.getElementById('user_confirm_send') != null) {
    document.getElementById('user_confirm_send').addEventListener('click', function(e) {
      let result = window.confirm('フレンド申請をしますか？');
      if (result == false) {
        e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
      }
    });
  }

  if (document.getElementById('user_confirm') != null) {
    document.getElementById('user_confirm').addEventListener('click', function(e) {
      let result = window.confirm("受諾通知を送信しますか？");
      if (result == false) {
        e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
      }
    });
    document.getElementById('user_confirm_refusal').addEventListener('click', function(e) {
      let result = window.confirm("申請を拒否しますか？");
      if (result == false) {
        e.preventDefault();  // デフォルトのイベント（リンクURLへの遷移処理など）を無効にする
      }
    });
  }
});
