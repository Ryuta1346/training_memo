class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def new
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
    params.require(:post).permit(:content, :weight, :body_fat_percentage, :date)
  end
end
