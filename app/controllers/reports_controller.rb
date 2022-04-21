class ReportsController < ApplicationController
  before_action :authorize_admin

	def index
		@reports = Order.where(created_at: (Time.zone.now.in_time_zone.beginning_of_day)..(Time.zone.now.in_time_zone.end_of_day)).where(status: "paid")
  end
end
