class UsersController < ApplicationController
  # that will be only for Admin?
  def index
    @users = User.all
  end

  def new
    @user = current_user
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    current_user.update!(user_params)
    current_user.create_location!
    respond_to do |format|
      format.js
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    # @user = current_user
  end

  def users_information
    current_user.update!(user_params)
    analise_location
    @photo = Photo.new
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update!(user_params)
    redirect_to user_path(@user)
    @user.location.update!(coord_params)
    # redirect_to user_path(@user) that string is bad for ajax!!!
  end

  def destroy; end

  private

  def analise_location
    results = Geocoder.search(request.location.data[:ip])
    results = results.first.coordinates
    current_user.create_location!(latitude: results.first.coordinates.first, longitude: results.first.coordinates.first)
  end

  def user_params
    params.require(:user).permit(:name, :surname, :nickname)
  end

  def coord_params
    params.require(:user).permit(:latitude, :longitude)
  end
end
