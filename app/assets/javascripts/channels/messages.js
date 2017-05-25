// Tell consumer - client side subcribe Message channel
App.messages = App.cable.subscriptions.create('MessagesChannel', {  
	received: function(data) {
		// This is callback method
		$("#messages").removeClass('hidden')
		return $('#messages').append(this.renderMessage(data));
	},

	renderMessage: function(data) {
		// This is callback method
		return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
	}
});