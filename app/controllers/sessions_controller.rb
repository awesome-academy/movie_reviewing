class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    if auth.present?
      user = User.from_omniauth(auth)
      if user
        render json: {
          status: :success
        }
        log_in user
      else
        render json: {
          status: :error
        }
      end
    else
      user = User.find_by email: params[:session][:email].downcase

      if user && user.authenticate(params[:session][:password])
        if user.activated?
          log_in user
          params[:session][:remember_me] == "1" ? remember(user) : forget(user)
          user.admin ? redirect_to(admin_root_url) : redirect_back_or(root_url)
        else
          message = t "flash.active_account"
          message += t "flash.check_email"
          flash[:warning] = message
          redirect_to root_url
        end
      else
        flash.now[:danger] = t "flash.invalid"
        render :new
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
