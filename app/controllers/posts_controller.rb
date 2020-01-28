class PostsController < ApplicationController
  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.create!(post_params)
    redirect_to user_posts_path
  end

  def index
    @posts = Post.all
  end

  def show
    @user = User.find_by(id: params[:user_id])
    puts @user.inspect
    @post = @user.posts.find_by(id: params[:id])
    puts @post.inspect
  end

  private

  def post_params
    params.permit(:title, :content)
  end
end
