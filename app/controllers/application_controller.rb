class ApplicationController < ActionController::Base
  helper_method :current_borrower, :current_lender, :require_login, :is_borrower_logged_in?, :is_lender_logged_in?, :user_authorized? #:admin_only,

  def is_borrower_logged_in?
    !!current_borrower
  end

  def is_lender_logged_in?
    !!current_lender
  end

  def current_borrower
    @current_borrower ||= Borrower.find_by(id: session[:borrower_id])
  end

  def current_lender
    @current_lender ||= Lender.find_by(id: session[:lender_id])
  end


end
