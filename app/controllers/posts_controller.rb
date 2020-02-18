# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_user, except: %i[main_page]
  before_action :find_post, except: %i[index new create main_page show]

  def index
    @posts = @user.posts.reverse
    @categories = Category.all
  end

  def main_page
    @tags = Tag.all
    @categories = Category.all
    @posts = if params[:tag].nil?
               Post.all
             else
               Tag.find_by(name: params[:tag]).posts
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
    @post.categories << Category.find_by(id: params[:post][:category_id])
    add_tag
    @categories = Category.all
    respond_to do |format|
      format.js
    end
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

  def add_tag
    tags = params[:post][:tags].split(',')
    puts tags.inspect
    tags.each { |tag| @post.tags << Tag.find_by_name(tag) }
  end

  def find_user
    @user = current_user
  end

  def find_post
    @post = @user.posts.find_by(id: params[:id])
    not_existed_error if @post.nil?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
