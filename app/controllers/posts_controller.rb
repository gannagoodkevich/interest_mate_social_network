require_relative '../services/post_creating_servise'

class PostsController < ApplicationController
  before_action :find_user, except: %i[main_page search order_by_likes]
  before_action :find_user_post, only: %i[edit update destroy]
  before_action :find_categories, only: %i[index main_page new edit create]

  def index
    @posts = if @user == current_user
               @user.posts
             else
               @user.posts.visible
             end
    @posts = @posts.page(params[:page])
    @posts = @posts.reverse_order
  end

  def main_page
    @tags = Tag.all
    @posts = if params[:tag].nil?
               Post.all.visible
             else
               posts_by_tag
             end
    @posts = @posts.page(params[:page])
    @posts = @posts.reverse_order
  end

  def new
    @post = Post.new
    @tag = Tag.new
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit; end

  def create
    _post_creating = PostCreatingService.new(@user).call(post_params)
    share_activity("#{current_user.nickname}: Created new post")
    respond_to do |format|
      format.js
    end
  end

  def update
    _post_updating = PostUpdatingService.new(@post).call(post_params)
    redirect_to user_posts_path(@user)
  end

  def search
    visible_posts = Post.visible
    @posts = PostsQuery.new(visible_posts).search_posts(params[:search_parameter], params[:search])
    respond_to do |format|
      format.js
    end
  end

  def like
    @post = @user.posts.find_by(id: params[:post_id])
    current_user.liked_posts << @post
    share_activity("#{current_user.nickname}: Liked #{@post.user.nickname}'s post")
    respond_to do |format|
      format.js
    end
  end

  def unlike
    @post = @user.posts.find_by(id: params[:post_id])
    @post.liked_posts_users.find_by(user_id: current_user.id).delete
    share_activity("#{current_user.nickname}: Revert like on #{@post.user.nickname}'s post")
    respond_to do |format|
      format.js
    end
  end

  def order_by_likes
    @posts = Post.left_joins(:liked_posts_users).group(:id).order('COUNT(liked_posts_users.id) DESC') if params[:order_parameter] == 'by_likes'
    @posts = Post.left_joins(:comments).group(:id).order('COUNT(comments.id) DESC') if params[:order_parameter] == 'by_comments'
    @posts = @posts.page(params[:page])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post.destroy!
    redirect_to user_posts_path(@user)
  end

  private

  def posts_by_tag
    Tag.find_by(name: params[:tag]).posts.visible
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
    not_existed_error if @user.nil?
  end

  def find_user_post
    @post = @user.posts.find_by(id: params[:id])
    not_existed_error if @post.nil?
  end

  def find_categories
    @categories = Category.all
  end

  def post_params
    params.require(:post).permit(:title, :content, :status, :category_id, :tags)
  end

  def tag_params
    params.require(:post).permit(:tags)
  end
end
