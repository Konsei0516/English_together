$(document).on('turbolinks:load',function(){ // フラッシュのフェードアウト
  setTimeout("$('.notifications').fadeOut('slow')", 10000) 
})