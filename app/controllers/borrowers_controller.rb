class BorrowersController < ApplicationController

  def new
    @borrower = Borrower.new
  end

  def index
    @borrowers = Borrower.all
  end

  def create
    @borrower = Borrower.new(borrower_params)
  end

  def show
    @borrower = Borrower.find_by(id: params[:id])
    @borrower.save
  end

  private

  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :dob, :street_address, :city, :zipcode, :email, :password, :password_confirmation)
  end
end
