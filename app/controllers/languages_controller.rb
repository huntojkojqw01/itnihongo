class LanguagesController < ApplicationController
	def create
		session[:locale]=params[:locale]
		if current_user
			current_user.update(locale: session[:locale])
		end		
		respond_to do |format|	        
	        format.html      
	    end
	end
end
