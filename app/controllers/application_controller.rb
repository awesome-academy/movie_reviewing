class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def default_url_options
    {locale: I18n.locale}
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  include SessionsHelper
  
  def logged_in_user
    if !logged_in?
      flash[:danger] = t "flash.login"
      redirect_to login_url
    end
  end
end
