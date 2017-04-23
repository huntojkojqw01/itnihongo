class FollowsController < ApplicationController
	before_action :authenticate_user!	
	def create
		@follow=Follow.new(user_id: current_user.id,pet_id: follow_params[:pet_id])
		respond_to do |format|
			if @follow.save
				format.html {redirect_to @follow, notice: 'Followed.'}
				format.js
			else
				format.html { render action: "new" }     	
	        	format.json { render json: @follow.errors, status: :unprocessable_entity}
			end
		end
	end
	def destroy
		# follow=Follow.where("user_id = ? and pet_id = ?",current_user.id,follow_params[:pet_id].to_i)
		follow=Follow.find_by(id: params[:id])
		follow.destroy
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
