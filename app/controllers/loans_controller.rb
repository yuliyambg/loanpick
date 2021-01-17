class LoansController < ApplicationController
  before_action :get_borrower
  before_action :get_loan, only: [:edit, :update, :show]

  def index
    @loans = @borrower.loans
  end

  def new
    @loan = @borrower.loans.build
  end

  def create
    @loan = @borrower.loans.build(loan_params)
    if @loan.save
      redirect_to borrower_loans_path(@borrower)
    else
      render :new
    end
  end

  def edit
    # @loan = @borrower.loans.where(id: params[:id]).first
    if @loan.accept
      flash[:warning] = "Lender already approved loan ID: #{@loan.id} "
      redirect_to borrower_loans_path(@borrower)
    end
  end

  def update
    # @loan = @borrower.loans.where(id: params[:id]).first
    if @loan.update(loan_params)
      redirect_to borrower_loans_path(@borrower)
    else
      render :edit
    end
  end

  def show
    # @loan = @borrower.loans.where(id: params[:id]).first
    unless @loan
      flash[:warning] = "Loan does not exist"
      redirect_to borrower_loans_path(session[:borrower_id])
    end
  end

  def destroy
    @loan = @borrower.loans.where(id: params[:id]).first.destroy
    flash[:warning] = "Loan is deleted"
    redirect_to borrower_loans_path(@borrower)
  end

  private
  def loan_params
    params.require(:loan).permit(:amount, :category, :term, :lender_id)
  end

  def get_loan
    @loan = @borrower.loans.where(id: params[:id]).first
  end

  def get_borrower
    @borrower = Borrower.where(id: params[:borrower_id]).first
    if @borrower.nil? ||(@borrower && (@borrower.id != session[:borrower_id]))
      flash[:notice] = "Do not have access"
      if session[:borrower_id]
        redirect_to borrower_loans_path(session[:borrower_id])
      else
        redirect_to root_path
      end
    end
  end
end