import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("Connected to the room!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("Recieving:")
    console.log(data.content)
    $('#main-activities').append('<p><small>' + data.content + '</small></p>')
    toastr.success('Are you the 6 fingered man?', {iconClass: 'toast-pink'})
  }
});
