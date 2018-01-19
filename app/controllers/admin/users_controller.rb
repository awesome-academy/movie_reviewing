class Admin::UsersController < Admin::BaseController
  def index
    @users = User.desc_create_time.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user.destroy
      flash[:success] = t "flash.delete_user"
    else
      flash[:danger] = t "flash.cant_load"
    end
    redirect_to admin_users_path
  end
end
