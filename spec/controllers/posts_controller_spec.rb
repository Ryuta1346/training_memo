require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    let!(:user) { create(:user) }

    context "as an authenticated user" do
      before do
        sign_in user
      end

      it "responds successfully" do
        get :index
        expect(response).to be_successful
      end

      it "returns a 200 response" do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :index
        expect(response).to have_http_status(302)
      end

      it "redirects to sign-in page" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#show" do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }

    context "as an authenticated user" do
      before do
        sign_in user
        get :show, params: { id: post.id }
      end

      it "responds successfully" do
        expect(response).to be_successful
      end
    end

    context "as a guest" do
      it "redirects to sign-in page" do
        get :show, params: { id: post.id }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#create" do
    let!(:user) { create(:user) }
    let!(:post_params) { attributes_for(:post) }

    context "as an authenticated user" do
      before do
        sign_in user
      end

      it "adds a post" do
        expect do
          post :create, params: { post: post_params }
        end.to change(Post, :count).by(1)
      end

      it "redirects to top-page" do
        post :create, params: { post: post_params }
        expect(response).to redirect_to(root_path)
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        post :create, params: { post: post_params }
        expect(response).to have_http_status(302)
      end

      it "redirects to sign-in page" do
        post :create, params: { post: post_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#update" do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user: user, training: "Training") }
    let(:post_params) { attributes_for(:post, training: "New Training") }

    context "as an authenticated user" do
      it "updates a post" do
        sign_in user
        patch :update, params: { id: post.id, post: post_params }
        expect(post.reload.training).to eq "New Training"
      end
    end
  end
end
