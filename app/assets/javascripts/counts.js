document.addEventListener("turbolinks:load", function() {
  //textarea入力のの字数カウントを行う
  if (document.getElementById('section_gist') != null) {
    document.getElementById('section_gist').addEventListener('input', function() {
      document.getElementById('gist-count').textContent = String(this.value.length) + '/1000'
    });
  }
});
