class RoomsController < ApplicationController
	def index
		@chatroom = Room.new
		@chatrooms = Room.all
	end

	def new
		if request.referrer.split("/").last == "chatrooms"
			flash[:notice] = nil
		end
		@chatroom = Room.new
	end

	def edit
		@chatroom = Room.find_by(slug: params[:slug])
	end

	def create
		@chatroom = Room.new(room_params)
		if @chatroom.save
			respond_to do |format|
				format.html { redirect_to @chatroom }
				format.js
			end
		else
			respond_to do |format|
				flash[:notice] = {error: ["a chatroom with this topic already exists"]}
				format.html { redirect_to new_croom_path }
				format.js { render template: 'rooms/room_error.js.erb'} 
			end
		end
	end

	def update
		chatroom = Room.find_by(slug: params[:slug])
		chatroom.update(room_params)
		redirect_to chatroom
	end

	def show
		@chatroom = Room.find_by(id: params[:id])
		@message = Message.new
	end

	private

	def room_params
		params.require(:room).permit(:topic)
	end
end