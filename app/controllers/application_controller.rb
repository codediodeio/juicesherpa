class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

=begin
  def authenticate_user!(*args)
    current_user.present? || super(*args)
  end

  def current_user
    super || User.where(soft_user_token: soft_user_token).first_or_initialize
  end

  private


  def soft_user_token
    session[:user_token] ||= SecureRandom.hex(8)
  end
=end

end
