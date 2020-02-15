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
    # will work only with heroku (?)
    current_user.update!(user_params)
    # results = location
    # current_user.create_location!(latitude: results.first.coordinates.first, longitude: results.first.coordinates.first)
    # if current_user.location.nil?
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

  def location
    location = request.location
    results = Geocoder.search(location.data[:ip])
    results.first.coordinates
  end

  def user_params
    params.require(:user).permit(:name, :surname, :nickname)
  end

  def coord_params
    params.require(:user).permit(:latitude, :longitude)
  end
end
