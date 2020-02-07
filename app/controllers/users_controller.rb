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
    redirect_to new_user_photo_path(@user)
  end

  def show
    @user = User.find_by(id: params[:id])
    results = Geocoder.search(remote_ip)
    @user.location.update!(latitude: results.first.coordinates.first, longitude: results.first.coordinates.second)
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update!(user_params)
    redirect_to user_path(@user)
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :nickname)
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1' || request.remote_ip == '::1'
      # Hard coded remote address
      '80.249.80.86'
    else
      request.remote_ip
    end
  end
end
