class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    create_new_rating @rating
  end

  def update
    @rating = Rating.find_by id: params[:id]
    if @rating
      if @rating.update_attributes rating_params
        render json: {
          status: :success,
          message: t("flash.update_rate_succeed"),
          content: render_to_string(partial: "films/rating",
            locals: {rating: @rating}),
          id: @rating.id,
          data: @rating,
          avg_rate: @rating.film.avg_rate
        }
      else
        render json: {
          status: :error,
          message: t("flash.update_rate_failed")
        }
      end
    else
      create_new_rating @rating
    end
  end

  def destroy
    @rating = Rating.find_by id: params[:id]
    if @rating.destroy
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

  def create_new_rating rating
    rating = Rating.new rating_params
    rating.user_id = current_user.id
    if rating.save
      render json: {
        status: :success,
        message: t("flash.create_rate_succeed"),
        content: render_to_string(partial: "films/rating",
          locals: {rating: rating}),
        data: rating,
        avg_rate: rating.film.avg_rate
      }
    else
      render json: {
        status: :error,
        message: t("flash.create_rate_failed")
      }
    end
  end

  def rating_params
    params.require(:rating).permit :mark, :film_id, :review
  end
end
