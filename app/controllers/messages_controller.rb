class MessagesController < ApplicationController
	def create
		message = Message.new(message_params)
		message.user = current_user
		if message.save
			# Broadcasting message immediately after it was created and saved to db
			ActionCable.server.broadcast 'messages',	
				# messages: name of channel we broadcasting to
				message: message.content,	# content of message
				user: message.user.name		# author of message
			head :ok
		end
	end

	private

	def message_params
		params.require(:message).permit(:content, :room_id)
	end
end