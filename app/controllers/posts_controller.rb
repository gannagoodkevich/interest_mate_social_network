class PostsController < ApplicationController
  before_action :find_user
  before_action :find_post, except: %i[index new create]

  def index
    @posts = @user.posts.reverse
  end

  def display_main_page
    @posts = Post.all
  end

  def new
    #@categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def create
    @post = @user.posts.create!(post_params)
    #@post.categories << Category.find_by(id: params[:category_id])
    redirect_to user_posts_path
  end

  def update
    @post.update!(post_params_update)
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
    params.permit(:title, :content)
  end

  def post_params_update
    params.require(:post).permit(:title, :content)
  end
end
