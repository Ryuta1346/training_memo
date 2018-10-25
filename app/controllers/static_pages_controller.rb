class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post  = current_user.posts.build
      @posts = current_user.posts.order(date: "DESC")
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
