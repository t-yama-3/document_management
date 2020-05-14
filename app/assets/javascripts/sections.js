$(document).on('turbolinks:load', ()=> {
  if ($('#document_form').length == 0) { return; }
  // 区分の選択を行った場合の処理
  $('#document_section_id').on('change', function(e) {
    let selectNum = $(this).val();
    // console.log(selectNum);
    if (selectNum == "") {
      $('#document_section_name_tr').show();
    } else {
      $('#document_section_name_tr').hide();
    }
  });

  $('#document_section_name').on('input', function(e) {
    let input = $(this).val();
    // console.log(input);
    if (input == "") {
      $('#document_section_id_tr').show();
    } else {
      $('#document_section_id_tr').hide();
    }
  });
});
