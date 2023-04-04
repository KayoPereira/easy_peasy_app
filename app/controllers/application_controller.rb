class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :role) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :role) }
  end

  private

  def user_not_authorized
    flash[:alert] = "Você não está autorizado a executar esta ação."
    redirect_to(request.referrer || root_path)
  end
end
