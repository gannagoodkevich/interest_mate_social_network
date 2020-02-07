# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_commentable, except: [:show]

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.last
    not_existed_error if @user.nil?
    @comment = @user.comments.create!(comment_params)
    @commentable.comments << @comment
    respond_to do |format|
      format.js
    end
  end

  def show
    @commentable = Comment.find_by_id(params[:id])
    not_existed_error if @commentable.nil?
    @comments = @commentable.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable = Post.find_by(id: params[:post_id])
    @commentable = Comment.find_by(id: params[:comment_id]) if params.key? :comment_id

    not_existed_error if @commentable.nil?
  end
end
