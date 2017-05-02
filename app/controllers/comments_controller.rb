class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@comment=Comment.new(comment_params)
		respond_to do |format|
			if @comment.save
				# if current_user!=@comment.photo.user
					Notification.create(recipient: @comment.photo.user, user: @comment.user, action: "commented", notifiable: @comment.photo)								
				# end
				format.js 
			else				
				format.json {render json: @comment.errors, status: :unprocessable_entity}
			end
		end
	end
	def update
		@comment=Comment.find_by(id: params[:id])
		respond_to do |format|
			if @comment.update(comment_params)
				format.js
			else
				format.json {render json: @comment.errors, status: :unprocessable_entity}
			end
		end
	end
	def destroy
		comment=Comment.find_by(id: params[:id])
		if comment
			@comment_id=comment.id
			comment.destroy
			respond_to do |format|
				format.js
			end
		else
			respond_to do |format|
				format.json
			end
		end
	end
	private
	def comment_params
		params.require(:comment).permit(:user_id,:photo_id,:content)
	end
end
