class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  # before_filter :require_current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_current_user
    redirect_to_login_path if current_user.nil?
  end

end
