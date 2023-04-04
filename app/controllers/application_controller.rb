class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :role)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :role)}
  end
end
