class SessionController < ApplicationController

  def new
  end

  def create
    # if a user logged in with omniauth
    if request.env["omniauth.auth"]
      #then find or create them in the db by uid
      @borrower = Borrower.find_by(email: request.env["omniauth.auth"]["extra"]["id_info"]["email"])
      if @borrower.nil?
        redirect_to new_borrowers_path
      end
      #log in
      session[:borrower_id] = @borrower.id
      redirect_to borrower_loans_path(@borrower)
    else
      @borrower = Borrower.find_by(:email => params[:email])
      if !@borrower
        @error = "Account not found. Please try again."
        render :new
      elsif !@borrower.authenticate(params[:password])
        @error = "Incorrect password. Please try again."
        render :new
      else
        #log in
        session[:borrower_id] = @borrower.id
        redirect_to borrower_loans_path(@borrower)
      end
    end
  end

  #logout
  def destroy
    session.clear
    redirect_to root_url
  end

end