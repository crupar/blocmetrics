class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!




private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action.  You must be logged in to do that."
    redirect_to(request.referrer || root_path)
  end

protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


end
