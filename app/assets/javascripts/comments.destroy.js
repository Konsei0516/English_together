$(function() {
  $(document).on("click", ".comment-destroy", function (e) {
    e.preventDefault();
    var delete_confirm = confirm('コメントを削除します。よろしいですか？');
    if (delete_confirm == true) {
      var comment_element = $(this).parents('.comments__text');
      var comment_id = comment_element.attr("data-comment-id");
      var url = location.href + "/comments/" + comment_id;
      $.ajax({
      url: url,
      type: "POST",
      data: {'id': comment_id, '_method': 'DELETE'},
      dataType: 'json'
      })
      .done(function(data) {
        comment_element.remove();
      })
      .fail(function() {
        alert('コメント削除の際にエラーが発生しました。');
      });
    }
  });
});