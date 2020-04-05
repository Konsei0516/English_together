$(document).on('turbolinks:load'function(){
  var getH = new Date().getHours();
  if((getH >= 6) && (getH < 17)) { $('.chat_box').removeClass('night').addClass('morning'); }
  else if( (getH >= 18) || (getH < 5) ) { $('.chat_box').removeClass('morning').addClass('night'); }
});