class AddressesController < ApplicationController
  before_action :find_user

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @user.address.update!(address_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def find_user
    @user = current_user
  end

  def address_params
    params.require(:address).permit(:country, :city, :street, :house_number, :apartment_number)
  end
end
