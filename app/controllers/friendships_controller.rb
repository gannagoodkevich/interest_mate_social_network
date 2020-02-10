class FriendshipsController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    @friendship = @user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
    else
      flash[:notice] = "Unable to add friend."
    end
    redirect_to root_url
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @friendship = @user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
