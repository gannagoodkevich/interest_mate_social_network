class CommentsController < ApplicationController
  before_action :find_commentable
  def index
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def create
    @user = User.last
    @comment = @user.comments.create!(comment_params)
    @commentable.comments << @comment
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  def show
    @commentable = Comment.find_by_id(params[:id])
    @comment = Comment.new
    @comments = @commentable.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id] && params[:comment_id].nil?
  end
end
