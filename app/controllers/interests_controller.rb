class InterestsController < ApplicationController
  before_action :find_user

  def index
    @interest_categories = InterestCategory.all
    @interests = @user.interests
  end

  def update
    @interest_categories = InterestCategory.all
    @user.user_interests.each(&:delete)
    user_interest_update
    share_activity("#{@user.nickname}: Updated interests")
    respond_to do |format|
      format.js
    end
  end

  def edit
    @interest_categories = InterestCategory.all
    respond_to do |format|
      format.js
    end
  end

  def create
    user_interest_update
    respond_to do |format|
      format.js
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:user_id])
    not_existed_error if @user.nil?
  end

  def user_interest_update
    params[:interests].each do |_key, value|
      puts value
      value.each do |interest|
        @user.interests << Interest.find_by(name: interest)
      end
    end
  end
end
