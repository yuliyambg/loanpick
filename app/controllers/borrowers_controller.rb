class BorrowersController < ApplicationController
  before_action :get_borrower, except: [:new, :create]

  def new
    @borrower = Borrower.new
  end

  def index
    @borrowers = Borrower.all
  end

  def create
    @borrower = Borrower.new(borrower_params)
    if @borrower.save
      session[:borrower_id] = @borrower.id
      redirect_to borrower_loans_path(@borrower)
    else
      render :new
    end
  end

  def show
    @borrower = Borrower.find_by(id: params[:id])
  end

  private

  def get_borrower
  @borrower = Borrower.where(id: params[:id]).first
  if @borrower.nil? ||(@borrower && (@borrower.id != session[:borrower_id]))
    flash[:notice] = "Do not have access"
    if session[:borrower_id]
      redirect_to borrower_path(session[:borrower_id])
    else
      redirect_to root_path
    end
  end
end

  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :dob, :street_address, :city, :zipcode, :email, :password, :password_confirmation)
  end
end
