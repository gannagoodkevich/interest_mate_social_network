class FriendshipRequestsController < ApplicationController
  before_action :find_user

  def create
    @friendship_request = FriendshipRequest.create!(requestor_id: current_user.id, receiver_id: @user.id)
    redirect_to user_path(id: @user.id)
  end

  def index
    @received_requests = @user.requestors
    @requested_requests = @user.receivers
  end

  private

  def find_user
    @user = User.find_by(id: params[:user_id])
    not_existed_error if @user.nil?
  end
end
