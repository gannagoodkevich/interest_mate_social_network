class FriendshipsController < ApplicationController
  def create
    @user = User.find_by(id: params[:requester_id])
    FriendshipRequest.find_by(requestor_id: @user.id, receiver_id: current_user.id).delete
    @user.friends << current_user
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @friends = @user.friends + @user.inverse_friends
  end

  def destroy
    # @user = User.find_by(id: params[:user_id])
    @user = current_user
    @friendship = @user.friendships
    @friendship = @user.inverse_friendships if @user.friendships.nil?
    @friendship.find_by(friend_id: @user.id).destroy
    # here should ve refactoring!!!s
    respond_to do |format|
      format.js
    end
  end
end
