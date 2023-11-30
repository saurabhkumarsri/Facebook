class ApplicationController < ActionController::Base
    before_action :require_login
  	helper_method :current_user

	protected
	def require_login
	    unless User.find_by(id: session[:user_id])
	      redirect_to user_login_path, alert: 'You must be logged in to access this page.'
	    end
  	end
	def current_user
	   @current_user ||= User.find_by(id: session[:user_id])
	end
end
