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

      it "render home template" do
        expect(response).to render_template(:home)
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

      it "render home template" do
        expect(response).to render_template(:home)
      end
    end
  end

  describe "#about" do
    before do
      get :about
    end

    it "returns 200 response" do
      expect(response).to have_http_status(200)
    end

    it "response successfully" do
      expect(response).to be_successful
    end

    it "render about template" do
      expect(response).to render_template(:about)
    end
  end

  describe "#help" do
    before do
      get :help
    end

    it "returns 200 response" do
      expect(response).to have_http_status(200)
    end

    it "response successfully" do
      expect(response).to be_successful
    end

    it "render help template" do
      expect(response).to render_template(:help)
    end
  end

  describe "#contact" do
    before do
      get :contact
    end

    it "returns 200 response" do
      expect(response).to have_http_status(200)
    end

    it "response successfully" do
      expect(response).to be_successful
    end

    it "render contact template" do
      expect(response).to render_template(:contact)
    end
  end
end
