class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   # just show a flash message instead of full CanCan exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to take this action."
    redirect_to home_path
  end

  # handle 404 errors with an exception as well
  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:error] = "404. Not Found"
    redirect_to home_path
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def logged_in?
    current_user
  end

  helper_method :logged_in?

  def check_login
    if current_user.nil?
      redirect_to login_path
      flash[:error] = 'You need to log in to view this page.'
    end
  end
end
