class AddressesController < ApplicationController
  def edit
    @user = current_user
    @address = @user.address
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = current_user
    @address = @user.address
    @address.update!(address_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def address_params
    params.require(:address).permit(:country, :city, :street, :house_number, :apartment_number)
  end
end
