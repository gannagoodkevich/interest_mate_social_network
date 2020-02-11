class FriendshipRequestsController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    @friendship_request = FriendshipRequest.create!(requestor_id: User.first.id, receiver_id: params[:user_id])
    redirect_to user_path(id: @user.id)
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @received_requests = @user.requestors
    @requested_requests = @user.receivers
  end

  def delete
    @user = User.find_by(id: params[:id])
    #@user.requestors.delete
  end

  private

  def permit
    @user.friends << @user.friendship_requests_as_requester
  end

end
