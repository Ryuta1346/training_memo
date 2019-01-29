require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, type: :controller
  end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

end
