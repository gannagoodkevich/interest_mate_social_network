class InterestsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @interest_categories = InterestCategory.all
    @interests = @user.interests
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @interest_categories = InterestCategory.all
    @user.user_interests.each { |user_interest| user_interest.delete }
    params[:interests].each do |_key, value|
      puts value
      value.each do |interest|
        @user.interests << Interest.find_by(name: interest)
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @interest_categories = InterestCategory.all
    respond_to do |format|
      format.js
    end
  end

  def create
    @user = User.find_by(id: params[:user_id])
    params[:interests].each do |_key, value|
      puts value
      value.each do |interest|
        @user.interests << Interest.find_by(name: interest)
      end
    end
    respond_to do |format|
      format.js
    end
  end
end
