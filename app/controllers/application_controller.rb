class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    if resource_class == Artist
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,
        :last_name, :role, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,
        :last_name, :role, :email, :password, :password_confirmation) }
    end
    if resource_class == Gallery
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,
        :representative_name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,
        :representative_name, :email, :password, :password_confirmation) }
    end
  end
end
