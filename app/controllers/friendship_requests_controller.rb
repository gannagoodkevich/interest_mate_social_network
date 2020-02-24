class FriendshipRequestsController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    @friendship_request = FriendshipRequest.create!(requestor_id: current_user.id, receiver_id: params[:user_id])
    redirect_to user_path(id: @user.id)
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @received_requests = @user.requestors
    @requested_requests = @user.receivers
  end
end
