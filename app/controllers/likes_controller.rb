class LikesController < ApplicationController
	before_action :authenticate_user!
	def create
		@like=Like.new(params.permit(:user_id,:photo_id))
		respond_to do |format|
			if @like.save				
				format.js 
			else						
				format.json {render json: @like.errors, status: :unprocessable_entity}
			end
		end
	end	
	def destroy
		like=Like.find_by(id: params[:id])
		@photo=like.photo
		like.destroy if like
		respond_to do |format|
			format.js			
		end
	end
	private
	def like_params
		params.require(:like).permit(:user_id,:photo_id)
	end
end
