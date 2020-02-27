# frozen_string_literal: true

class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit
    @user = current_user
    @photo = @user.photo
    if @photo.nil?
      @photo = Photo.new
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    @user = current_user
    @photo = @user.create_photo(photo_params) if @user.photo.nil?
    flash[:success] = 'Photo added!'
    @interest_categories = InterestCategory.all
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = current_user
    @photo = @user.photo.update!(photo_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
