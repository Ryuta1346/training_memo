class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
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