class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user           = current_user
      user            = @user
      @post           = user.posts.build
      @posts          = user.posts.all
      @first_bmi      = (user.weight / user.height / user.height).round(2)
      @recent_weight  = @posts.any? ? user.posts.first.weight : user.weight
      @recent_bmi     = @posts.any? ? (user.posts.first.weight / user.height / user.height).round(2) : @first_bmi
      @by_achievement = ((@posts.any? ? @recent_weight : user.weight) - user.aim).round(2)
      @by_last        = (Date.today - user.started_at + 1).to_i
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
