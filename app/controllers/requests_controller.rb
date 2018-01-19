class RequestsController < ApplicationController
    def new
      @request = Request.new
    end

    def create
      @request = Request.create request_params
      if @request.save
        flash[:success] = t "flash.create_request_success"
        redirect_to root_path
      else
        flash[:danger] = t "flash.create_request_fail"
        redirect_to root_path
    end

    def destroy
      if !current_user.admin?
        flash[:danger] = t "flash.permission_access"
        redirect_to root_path
      else
        if @post.destroy
          flash[:success] = t "flash.destroy_request_success"
        else
          flash[:danger] = t "flash.destroy_request_fail"
        end
        redirect_to root_path
      end
    end
  end

  private
  def request_params
    params.require(:request).permit :title, :content
  end
  end

