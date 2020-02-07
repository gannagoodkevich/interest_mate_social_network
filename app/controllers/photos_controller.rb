# frozen_string_literal: true

class PhotosController < ApplicationController
  # ...
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit; end

  def create
    @user = User.find_by(id: params[:user_id])
    @photo = @user.create_photo(photo_params)
    flash[:success] = 'Photo added!'
    redirect_to user_path(@user)
  end

  def update; end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
