# frozen_string_literal: true

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
end
