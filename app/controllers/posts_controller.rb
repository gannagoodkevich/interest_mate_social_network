class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @categories = Category.all
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:id])
    @categories = Category.all
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.create!(post_params)
    @post.categories << Category.find_by(id: params[:category_id])
    redirect_to user_posts_path
  end

  def show
    @user = User.find_by(id: params[:user_id])
    puts @user.inspect
    @post = @user.posts.find_by(id: params[:id])
    puts @post.inspect
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:id])
    @post.update!(post_params_update)
    redirect_to user_posts_path(@user)
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find_by(id: params[:id])
    @post.destroy!
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.permit(:title, :content)
  end

  def post_params_update
    params.require(:post).permit(:title, :content)
  end
end
