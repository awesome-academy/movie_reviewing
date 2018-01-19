class LikesController < ApplicationController
  def create
    @post = PostReview.find_by id: params[:post_review_id]
    @like = @post.likes.build
    @like.user = current_user
    if @like.save
      render json: {
        status: :success,
        content: render_to_string(partial: "likes/unlike",
          locals: {like: @like})
      }
    else
      render json: {
        status: :error
      }
    end
  end

  def destroy
    @post = PostReview.find_by id: params[:post_review_id]
    @like = Like.find_by id: params[:id]
    if @like.destroy
      render json: {
        status: :success,
        content: render_to_string(partial: "likes/like",
          locals: {like: @like})
      }
    else
      render json: {
        status: :error
      }
    end
  end
end
