$(function() {
  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/words/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(words) {
      console.log(words);
    })
  });
});