require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, type: :controller
  end

  describe "#home" do
    let!(:user) { create(:user) }

    context "as an authenticated user" do
      before do
        sign_in user
        get :home
      end

      it "returns 200 response" do
        expect(response).to have_http_status(200)
      end

      it "response successfully" do
        expect(response).to be_successful
      end
    end

    context "as a guest" do
      before do
        get :home
      end

      it "returns 200 response" do
        expect(response).to have_http_status(200)
      end

      it "response successfully" do
        expect(response).to be_successful
      end
    end
  end

  describe "#about" do
    it "returns 200 response" do
      get :about
      expect(response).to have_http_status(200)
    end

    it "response successfully" do
      get :about
      expect(response).to be_successful
    end
  end

  describe "#help" do
    it "returns 200 response" do
      get :help
      expect(response).to have_http_status(200)
    end

    it "response successfully" do
      get :help
      expect(response).to be_successful
    end
  end

  describe "#help" do
    it "returns 200 response" do
      get :contact
      expect(response).to have_http_status(200)
    end

    it "response successfully" do
      get :contact
      expect(response).to be_successful
    end
  end
end
