class AlbumsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:new,:show]
	before_action :album_params,:its_me!, only: :create
	def new
		@album=Album.new
	end
	def index
		if params[:user_id]
			@user = User.find_by(id: params[:user_id])
			@list_album = @user.albums;
		elsif params[:pet_id]
			@pet = Pet.find_by(id: params[:pet_id]);
			@list_album = @pet.albums;
		elsif user_signed_in?
			@list_album=current_user.albums
		else
			@list_album = Album.all
		end
	end
	def create
		@album=Album.new(album_params)		
		respond_to do |format|
	      if  @album.save
	      	format.html { redirect_to @album, notice: 'Album was successfully created.' }	      	
	        format.js
	      else	      	
	      	format.html { render action: "new" }	        
	        format.js { render "uncreate" }
	      end
	    end	    
	end
	def show
		@album=Album.find_by(id: params[:id])
		if @album
			@photos=@album.photos
		else
			flash[:danger]=t 'notfound'
			redirect_to root_path
		end		
	end
	private
    def album_params
      params.require(:album).permit(:pet_id, :name)
    end
    def its_me!
    	pet=Pet.find_by(id: album_params[:pet_id])
    	if !pet || pet.user!=current_user
    		flash[:danger]="You haven't permission to make album of this pet" 
			redirect_to root_path
		end   	
    end
end
