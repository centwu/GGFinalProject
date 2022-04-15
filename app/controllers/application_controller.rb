class ApplicationController < ActionController::Base
	def authorize_admin
    redirect_back fallback_location: root_path, status: 401 unless current_user && current_user.admin?
    #redirects to previous page
	end
end
