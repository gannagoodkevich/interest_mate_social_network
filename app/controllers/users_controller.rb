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
    current_user.create_location! if current_user.location.nil?
    @photo = Photo.new
    respond_to do |format|
      format.js
    end
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
