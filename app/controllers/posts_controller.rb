# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_user, except: %i[main_page search]
  before_action :find_user_post, only: %i[edit update destroy]
  before_action :find_categories, only: %i[index main_page new edit create]

  def index
    @posts = if @user == current_user
               @user.posts.reverse
             else
               @user.posts.visible.reverse
             end
  end

  def main_page
    @tags = Tag.all
    @posts = if params[:tag].nil?
               Post.all.visible.reverse
             else
               posts_by_tag.reverse
             end
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
    @post = @user.posts.create!(post_params)
    add_status
    @post.categories << Category.find_by(id: params[:post][:category_id])
    add_tag
    share_activity("#{current_user.nickname}: Created new post")
    respond_to do |format|
      format.js
    end
  end

  def update
    @post.update!(post_params)
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

  def destroy
    @post.destroy!
    redirect_to user_posts_path(@user)
  end

  private

  def add_status
    if params[:status] == 'visible'
      @post.visible!
    else
      @post.unvisible!
    end
  end

  def posts_by_tag
    Tag.find_by(name: params[:tag]).posts.visible
  end

  def add_tag
    tags = params[:post][:tags].split(',')
    puts tags.inspect
    tags.each do |tag_name|
      tag = Tag.find_by_name(tag_name)
      if tag.nil?
        flash[:success] = 'Tag is not valid'
      else
        @post.tags << tag
      end
    end
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
    params.require(:post).permit(:title, :content)
  end

  def tag_params
    params.require(:post).permit(:tags)
  end
end
