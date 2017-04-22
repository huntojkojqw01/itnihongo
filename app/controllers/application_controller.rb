class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  private
  def set_locale  	
  	if session[:locale]
  		I18n.locale=session[:locale].to_sym
  	else
  		if current_user
  			session[:locale]=current_user.locale
  			I18n.locale= (session[:locale]||:en).to_sym
  		else
  			session[:locale]="en"  			
   			I18n.locale= :en
  		end
  	end  	
   end 
end
