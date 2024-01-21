import consumer from "channels/consumer"

consumer.subscriptions.create("BlogChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    this.holder = document.getElementById("holder");
    console.log(data);
    if (this.holder) {
      this.title = document.createElement("strong");
      this.title.textContent = data.title;
      this.break = document.createElement("br");
      this.holder.append(this.title);
      this.holder.append(this.break);
      this.holder.append(data.content);
    }
    // Called when there's incoming data on the websocket for this channel
  }
});
