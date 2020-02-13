class FriendshipsController < ApplicationController
  def create
    @user = User.find_by(id: params[:requester_id])
    FriendshipRequest.find_by(requestor_id: @user.id, receiver_id: User.last.id).delete
    @user.friends << User.last
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @friends = @user.friends + @user.inverse_friends
  end

  def destroy
    # @user = User.find_by(id: params[:user_id])
    @user = User.last
    @friendship = @user.friendships
    @friendship = @user.inverse_friendships if @user.friendships.nil?
    @friendship.find_by(friend_id: @user.id).destroy
    respond_to do |format|
      format.js
    end
  end
end
