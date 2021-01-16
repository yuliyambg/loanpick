class LendersSessionController < ApplicationController

  def new
  end


  def create

      @lender = Lender.find_by(:email => params[:email])
      if !@lender
        @error = "Account not found. Please try again."
        render :new
      elsif !@lender.authenticate(params[:password])
        @error = "Incorrect password. Please try again."
        render :new
      else
        #log in
        session[:lender_id] = @lender.id
        redirect_to lender_lender_loans_path(@lender)
      end
    end

  #logout
  def destroy
    session.clear
    redirect_to root_url
  end

  end

