class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!(*args)
    current_user.present? || super(*args)
  end

  def current_user
    super || User.where(soft_user_token: soft_user_token).first_or_initialize
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :soft_user_token
  end


  private


  def soft_user_token
    session[:user_token] ||= SecureRandom.hex(8)
  end

end
