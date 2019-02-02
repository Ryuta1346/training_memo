class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user  = User.find_by(id: current_user.id)
      @posts = @user.posts.all
      @post  = @user.posts.build
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end