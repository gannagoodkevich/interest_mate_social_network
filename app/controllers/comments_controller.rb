class CommentsController < ApplicationController
  before_action :find_commentable
  def index
    @user = @post.user
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @user = User.last
    @comment = @commentable.comments.create!(comment_params)
    @user.comments << @comment
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
