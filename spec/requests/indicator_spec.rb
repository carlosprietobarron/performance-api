require 'rails_helper'

RSpec.describe "Indicators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/indicator/index"
      expect(response).to have_http_status(:success)
    end
  end

end
