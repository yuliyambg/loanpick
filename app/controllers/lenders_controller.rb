class LendersController < ApplicationController
  before_action :get_lender, except: [:new, :create]

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
    # @lender = Lender.where(id: params[:id]).first
    # unless @lender
    #   flash[:warning] = "Lender does not exists"
    #   redirect_to lenders_path(@lenders)
    # end
  end

  private

  def get_lender
    @lender = Lender.where(id: params[:id]).first
    if @lender.nil?  || (@lender && (@lender.id != session[:lender_id]))
      flash[:notice] = "Do not have access"
      if session[:lender_id]
        redirect_to lender_path(session[:lender_id])
      else
        redirect_to root_path
      end
    end
  end


  def lender_params
    params.require(:lender).permit(:name, :street_address, :city, :zipcode, :phone, :email, :password, :password_confirmation)
  end
end