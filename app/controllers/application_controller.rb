class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :logged_in?
  helper_method :logged_in_as_regular_user?

  # before_filter :authenticate_user!
  # before_filter :require_current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def logged_in_as_regular_user?
    logged_in? && current_user.regular_user?
  end

  def require_current_user
    redirect_to_login_path if current_user.nil?
  end



end
