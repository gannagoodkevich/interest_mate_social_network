class PostsController < ApplicationController
  before_action :find_user, except: %i[main_page]
  before_action :find_post, except: %i[index new create main_page]

  def index
    @posts = @user.posts.reverse
  end

  def main_page
    @posts = Post.all
    @tags = Tag.all
    @categories = Category.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @categories = Category.all
  end

  def create
    @post = @user.posts.create!(post_params)
    @post.categories << Category.find_by(id: params[:post][:category_id])
    redirect_to user_posts_path(@user)
  end

  def update
    @post.update!(post_params)
    redirect_to user_posts_path(@user)
  end

  def destroy
    @post.destroy!
    redirect_to user_posts_path(@user)
  end

  private

  def find_user
    @user = User.find_by(id: params[:user_id])
    not_existed_error if @user.nil?
  end

  def find_post
    @post = @user.posts.find_by(id: params[:id])
    not_existed_error if @post.nil?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
