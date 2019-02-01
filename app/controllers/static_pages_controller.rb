class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user    = current_user
      @post    = @user.posts.build
      @posts   = @user.posts.all
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
