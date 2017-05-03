class NotificationsController < ApplicationController
	def index
		if user_signed_in?
			notis=current_user.notifications
			respond_to do |format|
				format.html {render notis}
			end
		else			
		end
	end
	def destroy
		notification=Notification.find_by(id: params[:id])
		notification.destroy if notification
	end
end
