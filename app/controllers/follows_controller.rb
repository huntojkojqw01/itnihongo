class FollowsController < ApplicationController
	before_action :authenticate_user!
	def show
		if current_user.id!=params[:id].to_i
			flash[:danger]=t 'notpermit'
			redirect_to root_path
		else
			@follows=Follow.where(user_id: params[:id])
		end
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
