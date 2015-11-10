class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

  helper_method :current_user
end
