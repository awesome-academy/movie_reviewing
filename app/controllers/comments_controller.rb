class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
      @post = PostReview.find_by id: params[:post_review_id]
      @comment = @post.comments.build comment_params
      @comment.user = current_user
      if @comment.save
        render json: {
          status: :success,
          content: render_to_string(partial: "comment/comment",
            locals: {comment: @comment})
        }
      else
        render json: {
          status: :error
        }
      end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    @post = PostReview.find_by id: params[:post_review_id]
    if @comment.destroy
      render json: {
        status: :success
      }
    else
      render json: {
        status: :error
      }
    end
  end

  private

  def comment_params
    params.require(:comments).permit(:content)
  end

end
