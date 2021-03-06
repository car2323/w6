class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
  	if @current_user.nil?
  		@current_user = User.find_by(id: session[:user_id])
  	end
  	@current_user
  end  
  def autorize_user
  	if current_user.nil?
  		flash[:message] = "Please log in or register to access this page"
  		redirect_to root_path
  	end
  end
  def admin_only
  	    if current_user.nil? || current_user.role != "admin"
  		flash[:access_denied] = "Access denied. You must be admin to see this page."
  		redirect_to root_path
  	end
  end
end
