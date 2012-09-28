class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  helper_method :authenticated?
  def authenticated?
    session[:user_id].present?
  end

  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
