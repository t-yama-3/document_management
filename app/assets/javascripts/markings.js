$(document).on('turbolinks:load', ()=> {
  let token = document.getElementsByName("csrf-token")[0].content;
  $.ajax({
    url: "/documents/user_id",
    type: "GET",
    dataType: "json"
  })
  .done(function(data) {
    bookMark(data);
  });
  function bookMark(data) {
    $('#marking_id').on("click", function(e) {
      e.preventDefault();
      e.stopPropagation();
      if ($('#detail__marking').attr("class") == 'far fa-thumbs-up') {
        $.ajax({
          url: location.href + "/markings",
          type: "POST",
          data: {
            authenticity_token: token
          },
          dataType: "json",
        })
        .done(function(data) {
          $('#detail__marking').removeClass();
          $('#detail__marking').addClass('fas fa-thumbs-up');
          $('#detail__marking-text').html("good! " + data.count);
          $('#detail__marking').css('color', '#ffd700')
        })
      } else {
        if (confirm('good! を取り消しますか？') == true) {
          $.ajax({
            url: location.href + "/markings/" + data.user_id,
            type: "DELETE",
            data: {
              authenticity_token: token
            },
            dataType: "json"
          })
          .done(function(data) {
            $('#detail__marking').removeClass();
            $('#detail__marking').addClass('far fa-thumbs-up');
            $('#detail__marking-text').html("good! " + data.count);
            $('#detail__marking').css('color', '#ffffff')
          })
        }
      };
    });
  };
}); 