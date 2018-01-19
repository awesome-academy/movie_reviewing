class FilmsController < ApplicationController
  before_action :load_film

  def show
    @ratings = @film.ratings.desc_create_time.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
    if current_user
      @rating = @film.ratings.find_by user_id: current_user.id
      return if @rating
      @rating = @film.ratings.build
    else
      @rating = @film.ratings.build
    end
  end

  private

  def load_film
    @film = Film.find_by id: params[:id]
    return if @film
    flash[:danger] = t("flash.load_film") + "#{params[:id]}"
    redirect_to root_path
  end
end
