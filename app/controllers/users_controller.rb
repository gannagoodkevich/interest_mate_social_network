class UsersController < ApplicationController
  # that will be only for Admin?
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.create!(user_params)
    @user.create_location!
    redirect_to new_user_photo_path(@user)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update!(user_params)
    @user.location.update!(coord_params)
    #redirect_to user_path(@user) # that string is bad for ajax!!!
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
