class LendersController < ApplicationController


  def index
    @lenders = Lender.all
  end


  def show
    @lender = Lender.where(id: params[:id]).first
    unless @lender
      flash[:warning] = "Lender does not exists"
      redirect_to lenders_path(@lenders)
    end
  end

  private

  def lender_params
    params.require(:lender).permit(:name, :street_address, :city, :zipcode, :phone, :email)
  end
end