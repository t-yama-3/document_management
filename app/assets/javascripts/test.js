document.addEventListener('turbolinks:load', function() {
  // ロード時にカテゴリに関する情報を取得してselectタブを表示する
  // $('#register_new').on('click', function(e) {
  //   let url = $('#iframe_new').val();
  //   alert(url);
  //   $.ajax({
  //     url: url,
  //     type: "GET",
  //     data: {},
  //     dataType: "json"
  //   }).done(function(data, status, xhr) {
  //     alert("通信できました");
  //   }).fail(function(data, status, xhr){
  //     alert("通信失敗");
  //   });
  // });
  // let test = document.getElementById("register_new").getAttribute("value");

  // document.getElementById("register_new").addEventListener("submit", function(e) {
  //   e.preventDefault();  // デフォルトのイベント（HTMLデータ送信など）を無効にする
  //   let url = document.getElementById("iframe_new").value;  // 末尾に[.json]を追加してレスポンスデータのフォーマットをjson形式に指定
  //   let xmlHR = new XMLHttpRequest();  // XMLHttpRequestオブジェクトの作成
  //   xmlHR.open("GET", url);  // open(HTTPメソッド, URL, 非同期通信[true:default]か同期通信[false]か）
  //   xmlHR.send();  // sendメソッドでサーバに送信
  //   xmlHR.onreadystatechange = function() {
  //     if (xmlHR.readyState === 4) {  // readyStateが4になればデータの読込み完了
  //       console.log(xmlHR.status);
  //       if (xmlHR.status === 200) {  // statusが200の場合はリクエストが成功
  //         alert("success");
  //       } else {  // statusが200以外の場合はリクエストが適切でなかったとしてエラー表示
  //         console.log(xmlHR);
  //       }
  //     }
  //   };
  // });

  // window.addEventListener("unhandledrejection", function (event) {
  //   alert(event.reason);
  // });
  // window.onerror = (message, file, lineNo, colNo, error) => {
  //   alert(error);
  // }
  // $(function() {

  //   $('#iframe_main').on('load', function(e) {
  //       var body = $('body', this.contentWindow.document);
  //       console.log(body);
  //   });

  // });


  // let iframe = document.getElementById('iframe_main');
  // iframe.onload = function()
  // {
  //     alert( '読み込み完了' );
  //     doc = iframe.contentWindow.document;
  //     console.log(iframe);
  // }
});
