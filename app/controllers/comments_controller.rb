class CommentsController < ApplicationController
  def index
    @post = Post.find_by(id: params[:post_id])
    @user = @post.user
    @comments = @post.comments
    @comment = Comment.new
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @user = User.first
    @comment = @user.comments.create!(comment_params)
    @post.comments << @comment
    redirect_to user_post_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
