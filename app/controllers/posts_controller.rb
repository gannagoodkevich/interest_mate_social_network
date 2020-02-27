# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_user, except: %i[main_pageб search]
  before_action :find_post, except: %i[index new create main_page show search like unlike]

  def index
    @posts = if @user == current_user
               @user.posts.reverse
             else
               @user.posts.visible.reverse
             end
    @categories = Category.all
  end

  def main_page
    @tags = Tag.all
    @categories = Category.all
    @posts = if params[:tag].nil?
               Post.all.visible
             else
               Tag.find_by(name: params[:tag]).posts.visible
             end
  end

  def new
    @post = Post.new
    @categories = Category.all
    @tag = Tag.new
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @categories = Category.all
  end

  def create
    @post = @user.posts.create!(post_params)
    add_status
    @post.categories << Category.find_by(id: params[:post][:category_id])
    add_tag
    @categories = Category.all
    add_activity("#{current_user.nickname}: Created new post")
    ActionCable.server.broadcast 'room_channel',
                                 content: "#{current_user.nickname}: Created new post"
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
    add_activity("#{current_user.nickname}: Liked #{@post.user.nickname}'s' post")
    ActionCable.server.broadcast 'room_channel',
                                 content: "#{current_user.nickname}: Liked #{@post.user.nickname}'s post"
    respond_to do |format|
      format.js
    end
  end

  def unlike
    @post = @user.posts.find_by(id: params[:post_id])
    @post.liked_posts_users.find_by(user_id: current_user.id).delete
    add_activity("#{current_user.nickname}: Revert like on #{@post.user.nickname}'s post")
    ActionCable.server.broadcast 'room_channel',
                                 content: "#{current_user.nickname}: Revert like on #{@post.user.nickname}'s post"
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post.destroy!
    redirect_to user_posts_path(@user)
  end

  private

  def add_activity(content)
    current_user.activities.create!(content: content)
  end

  def add_status
    if params[:status] == 'visible'
      @post.visible!
    else
      @post.unvisible!
    end
  end

  def add_tag
    tags = params[:post][:tags].split(',')
    puts tags.inspect
    tags.each { |tag| @post.tags << Tag.find_by_name(tag) }
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end

  def find_post
    @post = @user.posts.find_by(id: params[:id])
    not_existed_error if @post.nil?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
