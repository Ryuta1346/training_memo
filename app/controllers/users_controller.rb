class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :show]

  def index
    @users = User.all
  end

  def show
    @user           = User.find(params[:id])
    user            = @user
    @posts          = user.posts.all
    @first_bmi      = (user.weight / user.height / user.height).round(2)
    @recent_weight  = @posts.any? ? user.posts.first.weight : user.weight
    @recent_bmi     = @posts.any? ? (user.posts.first.weight / user.height / user.height).round(2) : @first_bmi
    @by_achievement = ((@posts.any? ? @recent_weight : user.weight) - user.aim).round(2)
  end
end
