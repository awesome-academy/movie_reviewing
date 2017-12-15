class Admin::BaseController < ApplicationController
  before_action :logged_in_user
  before_action :check_admin

  private
  def check_admin
    if !current_user.admin?
      flash[:danger] = t "flash.permission_access"
      redirect_to root_path
    end
  end
end
