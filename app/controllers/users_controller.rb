class UsersController < ApplicationController
  # that will be only for Admin?
  def index
    @users = User.all
  end

  def new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    current_user.update!(user_params)
    current_user.create_location!
    redirect_to new_user_photo_path(current_user)
  end

  def show
    #@user = User.find_by(id: params[:id])
    @user = current_user
  end

  def update
    #@user = User.find_by(id: params[:id])
    current_user.update!(user_params)
    current_user.create_location!
    redirect_to user_path #that string is bad for ajax!!!
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :nickname)
  end

  def coord_params
    params.require(:user).permit(:latitude, :longitude)
  end
end
