class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :create_new_user

  def default_url_options
    {locale: I18n.locale}
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  include SessionsHelper

  def authenticate_user!
    store_location
    return if logged_in?
    flash[:danger] = t "flash.login"
    redirect_to login_url
  end

  def create_new_user
    @user = User.new
  end
end
