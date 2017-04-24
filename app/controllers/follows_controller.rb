class FollowsController < ApplicationController
	before_action :authenticate_user!
	def show
		@follows=Follow.where(user_id: params[:id])
	end	
	def create
		@follow=Follow.new(user_id: current_user.id,pet_id: follow_params[:pet_id])
		respond_to do |format|
			if @follow.save							
				format.js
			else				     	
	        	format.json { render json: @follow.errors, status: :unprocessable_entity}
			end
		end
	end
	def destroy		
		follow=Follow.find_by(id: params[:id])
		if follow
			@pet_id,@follow_id=follow.pet_id,follow.id
			follow.destroy
		end
		respond_to do |format|			
			format.html {redirect_to root_path, notice: 'Unfollowed.'}
			format.js			
		end
	end
	private
	def follow_params
		params.permit(:pet_id)
	end
end
