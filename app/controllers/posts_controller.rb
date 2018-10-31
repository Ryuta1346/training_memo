class PostsController < ApplicationController
  before_action :user_signed_in?, only:[:create, :destroy, :edit]
  before_action :correct_user, only:[:destroy, :edit]

  def index
    @posts = Post.all
  end

  def show
    @post  = Post.find(params[:id])
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_parameter)
      flash[:success] = "Post Updated!"
      redirect_to post_url
    else
      flash[:danger] = "Post Update is invalid!"
      render 'edit'
    end
  end

  def create
    @post = current_user.posts.build(post_parameter)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      flash[:danger] = "Post Not created!"
      redirect_to root_url
    end
  end


  private

    def post_parameter
      params.require(:post).permit(:content, :weight, :height, :date, :aim, :bmi, :training, :image)
    end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
