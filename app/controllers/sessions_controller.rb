class SessionsController < ApplicationController
  attr_accessor :user
    
  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user && @user.authenticate(params[:session][:password])
      if user.activated?
        log_in @user
        params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
        redirect_back_or @user
      else
        message = t "flash.active_account "
        message += t "flash.check_account"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = t "flash.invalid"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
