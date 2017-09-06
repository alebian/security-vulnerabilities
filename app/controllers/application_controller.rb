class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user
    return true if session[:user_id]
    redirect '/'
  end

  def current_user
    current_user ||= User.find(session[:user_id])
  end
end
