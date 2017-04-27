class AlbumsController < ApplicationController
	before_action :authenticate_user!
	before_action :album_params, only: :create
	def new
		@album=Album.new
	end
	def index
		@list_album = Album.all
		
	end
	def create
		@album=Album.new(album_params)		
		respond_to do |format|
	      if  @album.save
	      	format.html { redirect_to @album, notice: 'Album was successfully created.' }	      	
	        format.js {}
	      else
	      	format.html { render action: "new" }     	
	        format.json { render json: @album.errors, status: :unprocessable_entity}
	      end
	    end	    
	end
	def show
		@album=Album.find_by(id: params[:id])
		redirect_to root_path unless @album
		@photos=@album.photos
	end
	private
    def album_params
      params.require(:album).permit(:pet_id, :name)
    end
end
