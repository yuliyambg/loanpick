class LenderLoansController < ApplicationController
  before_action :get_lender

  def index
    # @lender = Lender.find(params[:lender_id])
    @loans = @lender.loans
  end


  def edit
    @loan = @lender.loans.where(id: params[:id]).first
    unless @loan
      flash[:warning] = "Loan does not exists"
      redirect_to lender_lender_loans_path(@lender)
    end
    # @loan = Loan.find(params)
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
    # @lender = Lender.find(params[:lender_id])
    @lender = Lender.where(id: params[:lender_id]).first
    unless @lender
      flash[:warning] = "Lender doesn't exists"
      redirect_to lenders_path(@lenders)
    end
    # if @borrower.nil?  || (@borrower && (@borrower.id != session[:borrower_id]))
    #   flash[:notice] = "Do not have access"
    #   redirect_to borrower_loans_path(session[:borrower_id])
  end

  def lender_loan_params
    params.require(:loan).permit(:accept)
  end

end