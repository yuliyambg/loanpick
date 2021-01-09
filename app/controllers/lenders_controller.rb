class LendersController < ApplicationController


  def index
    @lenders = Lender.all
  end


  def show
    @lender = Lender.find_by(params[:id])
  end

  private

  def lender_params
    params.require(:lender).permit(:name, :street_address, :city, :zipcode, :phone, :email)
  end
end