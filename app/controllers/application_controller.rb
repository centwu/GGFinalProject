class ApplicationController < ActionController::Base
	def authorize_admin
    redirect_to root_path unless current_user && current_user.admin?
	end
end
