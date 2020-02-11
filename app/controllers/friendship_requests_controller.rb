class FriendshipRequestsController < ApplicationController
  def create
    @friendship_request = FriendshipRequest.create!(requester_id: User.first.id, receiver_id: params[:user_id])
  end

  def show
    @user = User.find_by(id: params[:id])
    @received_requests = @user.requestors
    @requested_requests = @user.friendship_requests_as_requester
  end

  def delete
    @user = User.find_by(id: params[:id])
    @user.friendship_requests_as_receiver.delete
  end

  private

  def permit
    @user.friends << @user.friendship_requests_as_requester
  end

end
