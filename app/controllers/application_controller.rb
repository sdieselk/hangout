class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if !logged_in?
      redirect_to root_path, success: "ログインが必要です"
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
