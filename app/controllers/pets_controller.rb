class PetsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!
	def new
		@pet=Pet.new		
	end
	def create
		@pet=Pet.new(pet_params)
		if @pet.save
			Album.create(name: @pet.name,pet_id: @pet.id)
			flash[:success]="Create pet success"			
			redirect_to @pet		    
		else
			flash[:danger]=@pet.errors.full_messages.join(",")
			render 'new'
		end
	end
	def show
		@pet=Pet.find_by(id: params[:id])
		@photos=@pet.photos
		@albums=@pet.albums
		redirect_to root_path unless @pet
	end
	def update
		@pet=Pet.find_by(id: params[:id])
		respond_to do |format|
			if @pet.update(pet_params)
				format.html {redirect_to @pet,notice: "Updated"}
				format.js
			else
				format.html {render 'edit'}
				format.json {render json: @pet.errors, status: :unprocessable_entity }
			end
		end
	end
	def destroy
		pet=Pet.find_by(id: params[:id])
		pet.destroy
		respond_to do |format|
			format.html {redirect_to current_user, notice: "Pet deleted"}
			format.js
		end
	end
	private
	def pet_params
		params.require('pet').permit(:name,:user_id,:gender,:avatar,:kind_id,:birthday,:weight,:description )
	end
end
