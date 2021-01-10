class ApplicationController < ActionController::Base
  helper_method :current_borrower, :current_lender, :require_login, :is_borrower_logged_in?, :is_lender_logged_in?, :user_authorized? #:admin_only,

  # def current_borrower
  #   if session[:borrower_id].present?
  #     borrower = Borrower.find_by(:id => session[:borrower_id])
  #   end
  # end

  def require_login
    unless current_borrower
      redirect_to root_url
    end
  end


  # def logged_in?
  #   !!current_borrower || !!current_lender
  # end


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

  # def admin_only
  #   unless current_user.admin
  #     flash[:notice] = "You must be an admin to perform that function!"
  #     redirect_to user_path(current_user)
  #   end
  # end

end
