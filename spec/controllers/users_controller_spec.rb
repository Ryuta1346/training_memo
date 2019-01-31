require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#index" do
    let!(:user) { create(:user) }

    context "as an authenticated user" do
      before do
        sign_in user
        get :index
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
        get :index
      end

      it "returns 302 response" do
        expect(response).to have_http_status(302)
      end

      it "redirects to sign-in page" do
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    describe "#show" do
      let!(:user) { create(:user) }

      context "as an authenticated user" do
        before do
          sign_in user
          get :show, params: { id: user.id }
        end

        it "responds successfully" do
          expect(response).to be_successful
        end
      end

      context "as a guest" do
        before do
          get :show, params: { id: user.id }
        end

        it "returns 302 rensponse" do
          expect(response).to have_http_status(302)
        end

        it "redirects to sign-in page" do
          expect(response).to redirect_to "/users/sign_in"
        end
      end
    end
  end
end