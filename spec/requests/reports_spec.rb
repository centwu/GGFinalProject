require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "GET /daily" do
    it "returns http success" do
      get "/reports/daily"
      expect(response).to have_http_status(:success)
    end
  end

end
