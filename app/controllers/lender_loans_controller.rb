class LenderLoansController < ApplicationController
  before_action :get_lender

  def index
    @loans = @lender.loans
  end


  def edit
    @loan = @lender.loans.where(id: params[:id]).first
    unless @loan
      flash[:warning] = "Loan does not exists"
      redirect_to lender_lender_loans_path(@lender)
    end
  end

  def update
    @loan = @lender.loans.where(id: params[:id]).first
    if @loan.update(lender_loan_params)
      redirect_to lender_lender_loans_path(@lender)
    else
      render :edit
    end

  end

  private

  def get_lender
    @lender = Lender.where(id: params[:lender_id]).first
    if @lender.nil?  || (@lender && (@lender.id != session[:lender_id]))
      flash[:notice] = "Do not have access"
      if session[:lender_id]
        redirect_to lender_lender_loans_path(session[:lender_id])
      else
        redirect_to root_path
      end
    end
  end

  def lender_loan_params
    params.require(:loan).permit(:accept)
  end

end