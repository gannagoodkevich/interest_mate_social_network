class FriendshipsController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    @user.friends << User.last
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @friends = @user.friends + @user.inverse_friends
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @friendship = @user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to @user
  end
end
