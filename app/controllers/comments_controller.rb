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
    redirect_to user_post_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end
end