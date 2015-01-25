class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :authenticate!

  private

  def current_user
    User.find(cookies.signed['u']) rescue nil
  end

  def authenticate!
    redirect_to '/auth/twitter' unless current_user.present?
  end
end

