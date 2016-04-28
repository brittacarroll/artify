class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  helper_method :mailbox, :current_user, :conversation

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def mailer_set_url_options
   ActionMailer::Base.default_url_options[:host] = 'request.host_with_port'
  end

  protected

  def configure_permitted_parameters
    if resource_class == Artist
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,
        :last_name, :role, :email, :password, :password_confirmation, :avatar,
        :description, :title, :art) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,
        :last_name, :role, :email, :password, :password_confirmation, :avatar,
        :description, :title, :art) }
    end
    if resource_class == Gallery
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,
        :representative_name, :email, :password, :password_confirmation, :avatar) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,
        :representative_name, :email, :password, :password_confirmation, :avatar) }
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  def authenticate!
    if @current_artist == current_artist
      :authenticate_artist
    elsif @current_gallery == current_gallery
      :authenticate_gallery
    end
  end

  def current_user
    if current_artist
      current_artist
    else
      current_gallery
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Artist)
      artists_path
    elsif resource.is_a?(Gallery)
      galleries_path
    end
  end
end
