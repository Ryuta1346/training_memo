class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user  = current_user
      @posts = current_user.posts.all
      @post  = current_user.posts.build
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end