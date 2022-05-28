class ApplicationController < ActionController::Base
	def authorize_admin
    redirect_to root_path unless current_user && current_user.admin?
	end

	def append_info_to_payload(payload)
			super
		case
		when payload[:status] == 200
			payload[:level] = "INFO"
		when payload[:status] == 302
			payload[:level] = "WARN"
		else
			payload[:level] = "ERROR"
		end
	end
end
