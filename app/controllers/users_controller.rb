class UsersController < ApplicationController
  def show
	@user = User.find_by(id: params[:id]);
	if @user
	  	@pets=@user.pets
	  	@photos=(@user.photos+@user.following_photos).sort_by {|photo| -photo.created_at.to_i}  	 	
  	else
  		flash[:warning]="User not exist"
  		redirect_to root_path
  	end
  end  	
end
