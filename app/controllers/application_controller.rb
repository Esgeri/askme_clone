class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def reject_user
    redirect_to root_path, alert: 'Вам сюда нельзя!'
  end
end
