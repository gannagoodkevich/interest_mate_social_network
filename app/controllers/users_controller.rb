class UsersController < ApplicationController
  before_action :find_user, only: %i[show]
  before_action :find_current_user, except: %i[show]

  def index
    @users = User.all
  end

  def new
    @user.update!(online: true)
    @user.create_address!
    analise_location
  end

  def settings; end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def birthday_edit
    respond_to do |format|
      format.js
    end
  end

  def birthday_update
    @user.update!(birthday: params[:user][:birthday])
    respond_to do |format|
      format.js
    end
  end

  def show
    @friends = @user.friends + @user.inverse_friends
    @interest_categories = InterestCategory.all
    @full_matchings = []
    @half_matching = []
    find_matching_users
  end

  def users_information
    @user.update!(user_params)
    @photo = Photo.new
    respond_to do |format|
      format.js
    end
  end

  def update_location
    @user.location.update!(coord_params)
    redirect_to user_path(id: current_user.id)
  end

  def update
    @user.update!(user_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy; end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def find_current_user
    @user = current_user
  end

  def find_matching_users
    users = User.all - @friends
    users.delete(@user)
    users.each do |friend|
      @full_matchings << friend if @user.interests.sort == friend.interests.sort
      intersection = @user.interests & friend.interests
      @half_matching << friend if intersection.length > @user.interests.length / 5
    end
  end

  def analise_location
    puts request.location.latitude.inspect
    current_user.create_location!(latitude: request.location.latitude, longitude: request.location.longitude)
  end

  def user_params
    params.require(:user).permit(:name, :surname, :nickname)
  end

  def coord_params
    params.require(:user).permit(:latitude, :longitude)
  end
end
