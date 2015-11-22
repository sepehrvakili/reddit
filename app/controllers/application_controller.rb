class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  ## Replacing the old manual way with Devise above
  # helper_method :current_user

  # def current_user
  #   user_id = session[:user_id]

  #   if user_id
  #     @current_user ||= User.find(user_id)
  #   end
  # end

  # def authenticate_user!
  #   unless current_user 
  #     flash[:notice] = "You have to be logged in to do that."
  #     redirect_to login_path
  #   end
  # end
  
end
