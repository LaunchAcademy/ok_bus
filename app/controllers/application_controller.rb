class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize!
    if current_user.nil? || !current_user.admin?
      flash[:notice] = "You must be an admin to access this!"
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :profile_photo]
    devise_parameter_sanitizer.for(:account_update) << [:profile_photo]
  end
end
