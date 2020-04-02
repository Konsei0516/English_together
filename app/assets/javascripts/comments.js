$(window).on('turbolinks:load',function(){
$(function(){
  function buildHTML(comment){
    var html = `<div class="comments__text" data-comment-id="${comment.id}">
                  <p>
                    <strong>
                      <a href = /users/${comment.user_id}>${comment.user_name}</a>
                    </strong>:
                    ${comment.text}
                    <a class="comment-destroy" href=""><i class="fa fa-times-circle"></i></a>
                  </p>
                </div>`
    return html;
  }
  $('#new_comment').on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.form__textbox').val('');
      $('.form__submit').prop('disabled',false);
    })
    .fail(function(){
      alert('error');
    })
  })
});
});
