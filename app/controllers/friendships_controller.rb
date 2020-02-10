class FriendshipsController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    @friendship = @user.friendships.build(friend_id: params[:friend_id])
    flash[:notice] = if @friendship.save
                       'Added friend.'
                     else
                       'Unable to add friend.'
                     end
    redirect_to root_url
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @friendship = @user.friends
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @friendship = @user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to @user
  end
end
