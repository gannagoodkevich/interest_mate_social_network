class CommentsController < ApplicationController
  before_action :find_commentable, except: [:show]

  def index
    @comments = @commentable.comments
    @comments = @comments.page(params[:page])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create!(comment_params)
    @commentable.comments << @comment
    share_activity("#{current_user.nickname}: Commented #{@commentable.user.nickname}'s post") if @commentable.is_a? Post
    respond_to do |format|
      format.js
    end
  end

  def show
    @commentable = Comment.find_by_id(params[:id])
    not_existed_error if @commentable.nil?
    @comments = @commentable.comments
    @comments = @comments.page(params[:page])
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
