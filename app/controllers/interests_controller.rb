class InterestsController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    params[:interests].each do |_key, value|
      puts value
      @user.interests << Interest.find_by(name: value)
    end
    respond_to do |format|
      format.js
    end
  end
end
