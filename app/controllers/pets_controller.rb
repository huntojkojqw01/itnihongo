class PetsController < ApplicationController
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
	end
	private
	def pet_params
		params.require('pet').permit(:name,:user_id,:gender,:avatar,:kind_id,:birthday,:weight,:description )
	end
end
