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
    @friendship = find_friendship
    find_user_friendship.destroy
    # here should ve refactoring!!!s
    respond_to do |format|
      format.js
    end
  end

  private

  def find_friendship
    @user.inverse_friendships + @user.friendships
  end

  def find_user_friendship
    if @user.inverse_friendships.find_by(friend_id: @user.id).nil?
      @user.friendships.find_by(user_id: @user.id)
    else
      @user.inverse_friendships.find_by(friend_id: @user.id)
    end
  end
end
