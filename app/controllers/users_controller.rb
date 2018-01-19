class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :create, :new]
  before_action :correct_user, only: [:edit, :update]
  before_action :load_user, except: [:index, :new, :create]

  def show
    @posts = @user.post_reviews.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
    @bookings = @user.bookings.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      UserMailer.account_activation(@user).deliver
      flash[:info] = t "flash.check_email"
      redirect_to root_url
    else
      render "new"
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.update_profile"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "flash.delete_user"
    else
      flash[:danger] = t "flash.cant_load"
    end
    redirect_to users_url
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t("flash.find_user") + "#{params[:id]}"
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :dob, :avatar
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end
end
