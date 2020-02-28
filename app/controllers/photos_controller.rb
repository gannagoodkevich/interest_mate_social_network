# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :find_user, only: %i[edit create update]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = @user.photo
    @photo = Photo.new if @photo.nil?
    respond_to do |format|
      format.js
    end
  end

  def create
    @photo = @user.create_photo!(photo_params) if @user.photo.nil?
    flash[:success] = 'Photo added!'
    @interest_categories = InterestCategory.all
    respond_to do |format|
      format.js
    end
  end

  def update
    @photo = @user.photo.update!(photo_params)
    share_activity("#{@user.nickname}: Updated avatar")
    respond_to do |format|
      format.js
    end
  end

  private

  def find_user
    @user = current_user
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end
