$(document).on('turbolinks:load', ()=> {
  //説明の字数カウントを行う
  $('#section_gist').on('input', function() {
    $('#gist-count').text(String($('#section_gist').val().length) + '/1000');
  });
});
