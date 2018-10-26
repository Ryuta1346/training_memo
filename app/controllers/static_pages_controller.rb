class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post  = current_user.posts.build
      @posts = current_user.posts.all
      @recent_weight = current_user.posts.first.weight || current_user.weight
      @recent_bmi = (current_user.weight / current_user.height / current_user.height).round(2)
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
