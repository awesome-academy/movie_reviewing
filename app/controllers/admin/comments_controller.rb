class Admin::CommentsController < Admin::BaseController
  def index
    @comments = Comment.desc_create_at.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment.destroy
      flash[:success] = t "flash.destroy_comment_success"
    else
      flash[:danger] = t "flash.destroy_comment_failed"
    end
    redirect_to admin_comments_path
  end
end
