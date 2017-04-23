class UsersController < ApplicationController
  def show
  	@user=current_user
  	@pets=@user.pets
  	@photos=(@user.photos+@user.following_photos).sort_by {|photo| -photo.created_at.to_i}  	 	
  end  	
end
