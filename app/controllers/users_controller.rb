class UsersController < ApplicationController

  # that will be only for Admin?
  def index
  end

  def new
  end

  def edit
  end

  def create
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end
end
