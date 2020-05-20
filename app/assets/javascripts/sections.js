document.addEventListener("turbolinks:load", function() {
  if ($('#document_form').length == 0) { return; }
  // 新規コンテンツ登録画面で、区分selectタブを選択した場合の処理
  document.getElementById('document_section_id').addEventListener('change', function(e) {
    let selectNum = this.value;
    if (selectNum == "") {
      document.getElementById('document_section_name_tr').removeAttribute('style');
    } else {
      document.getElementById('document_section_name_tr').style.display = 'none';
    }
  });

  // 新規コンテンツ登録画面で、新規区分の入力を行った場合の処理
  document.getElementById('document_section_name').addEventListener('input', function(e) {
    let input = this.value;
    if (input == "") {
      document.getElementById('document_section_id_tr').removeAttribute('style');
    } else {
      document.getElementById('document_section_id_tr').style.display = 'none';
    }
  });
});
