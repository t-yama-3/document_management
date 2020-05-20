$(document).on('turbolinks:load', function() {
  if (document.getElementById("message_id") == null) {
    return;
  } else {
    let token = document.getElementsByName("csrf-token")[0].content;
    let url = location.href;
    $.ajax({
      url: url,  // リクエストを送信するURLを指定
      type: "POST",  // HTTPメソッドを指定（デフォルトはGET）
      data: {
        _method: 'PUT',
        authenticity_token: token
      },
      dataType: "json"  // レスポンスデータをjson形式と指定する
    })
    .done(function(data) {
      if (data.id == $("#message_id").val()) {
        $('#message_unread').removeClass();
        $('#message_unread').addClass('far fa-envelope-open');
        $('#message_unread').css('color', '#212529');
        $('#message_unread_text').text('既読');
      }
    })
    .fail(function() {
    })
    .always(function() {
    });
  }
})