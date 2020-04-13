//ユーザーのインクリメンタルサーチ
$(document).on('turbolinks:load',function() {
  function addUser(user) {
    let html = `
      <div class="search-result__user">
        <a href= "/users/${user.id}">${user.name}</a>
      </div>
    `;
    $(".user-search-result").append(html);
  }

  function addNoUser() {
    let html = `
      <div class="search-result__user">
        ユーザーが見つかりません
      </div>
    `;
    $(".user-search-result").append(html);
  }

  $(".search-input__user").on("keyup", function() {
    var input = $(".search-input__user").val();
    $.ajax({
      type: 'GET',
      url: '/users/user_search',
      data: { search: input },
      dataType: 'json'
    })
    .done(function(users) {
      $(".user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user) {
          addUser(user);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoUser();
      }
    })
    .fail(function(){
      alert('検索に失敗しました');
    });
  });
});
