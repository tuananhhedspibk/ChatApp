//= require cable
//= require_self
//= require_tree .

// Define the client-side instance of WebSocket connection

this.App = {}

App.cable = ActionCable.createConsumer();