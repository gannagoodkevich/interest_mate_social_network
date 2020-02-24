# frozen_string_literal: true

class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit; end

  def create
    @user = current_user
    @photo = @user.create_photo(photo_params) if @user.photo.nil?
    flash[:success] = 'Photo added!'
    @interest_categories = InterestCategory.all
    respond_to do |format|
      format.js
    end
  end

  def update; end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
