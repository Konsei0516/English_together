$(document).on('turbolinks:load',function() {
  function addWord(word) {
    let html = `
      <div class="search-result">
        <a href= "/words/${word.id}">${word.name}</a>
      </div>
    `;
    $(".word-search-result").append(html);
  }

  function addNoWord() {
    let html = `
      <div class="search-result">
        単語が見つかりません
      </div>
    `;
    $(".word-search-result").append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/words/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(words) {
      $(".word-search-result").empty();
      if (words.length !== 0) {
        words.forEach(function(word) {
          addWord(word);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        addNoWord();
      }
    })
    .fail(function(){
      alert('検索に失敗しました');
    });
  });
});