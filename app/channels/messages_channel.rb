class MessagesChannel < ApplicationCable::Channel 
	# define one channel 
	def subscribed
		stream_from 'messages'
		# subscribe and stream messages that are broadcasted to this channel
		# Redis will stream message immediately after message was sent 
		# by Redis to Message Channel
		# Redis will ensure that messages will be synced accross instances
	end
end 