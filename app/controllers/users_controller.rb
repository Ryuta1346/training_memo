class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:index, :update, :edit, :destroy]
  before_action :correct_user, only: [:update, :edit]

  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @user           = User.find(params[:id])
    @posts          = @user.posts.all
    @first_bmi      = (@user.weight / @user.height / @user.height).round(2)
    @recent_weight  = @posts.any? ? @user.posts.first.weight : @user.weight
    @recent_bmi     = @posts.any? ? ((@user.posts.first.weight).to_f / (@user.height).to_f / (@user.height).to_f).round(2) : @first_bmi
    @by_achievement = ((@posts.any? ? @recent_weight : @user.weight).to_f - (@user.aim).to_f).round(2)
    @by_last        = ((Date.today) - @user.started_at + 1).to_i
  end

  private
end
