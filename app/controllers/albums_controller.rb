class AlbumsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:new,:show]
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
end
