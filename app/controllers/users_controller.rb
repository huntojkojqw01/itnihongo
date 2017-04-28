class UsersController < ApplicationController
  def show
		@user = User.find_by(id: params[:id]);
  	@pets=@user.pets
  	@photos=(@user.photos+@user.following_photos).sort_by {|photo| -photo.created_at.to_i}  	 	
  end  	
end
