App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(message) {
    const messages = document.getElementById('messages')
    messages.innerHTML += message
    console.log(messages)
  },

  speak: function(content) {
    return this.perform('speak', {message: content});
  }
});

document.addEventListener('DOMContentLoaded',function(){
  const input = document.getElementById('chat-input')
  const button = document.getElementById('button__chat')
  button.addEventListener('click',function(){
    content = input.value
    App.room.speak(content)
    input.value = ''
  })
})