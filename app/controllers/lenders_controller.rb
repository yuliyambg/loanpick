class LendersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @lender = Lender.new
  end

  def index
    @lenders = Lender.all
  end

  def create
    @lender = Lender.new(lender_params)
    if @lender.save
      session[:lender_id] = @lender.id
      redirect_to lender_lender_loans_path(@lender)
    else
      render :new
    end
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
    params.require(:lender).permit(:name, :street_address, :city, :zipcode, :phone, :email, :password, :password_confirmation)
  end
end