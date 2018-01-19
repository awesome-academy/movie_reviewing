class Admin::FilmsController < Admin::BaseController
  before_action :load_films, except: [:new, :create, :index]

  def index
    @films = Film.select_film.desc_create_time.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def new
    @film = Film.new
    @film.categories.build
    @film.watching_days.build
    @film.watching_times.build
  end

  def create
    @film = Film.new film_params
    if @film.save
      flash[:success] = t("flash.create_new_film")
    else
      flash[:danger] = t("flash.fail_create_film")
    end
    redirect_to admin_films_path
  end

  def update
    if @film.update_attributes film_params
      flash[:success] = t("flash.update_film")
    else
      flash[:danger] = t("flash.fail_update_film")
    end
    redirect_to admin_films_path
  end

  def destroy
    if @film.destroy
      flash[:success] = t("flash.delete_film")
    else
      flash[:danger] = t("flash.fail_delete_film")
    end
    redirect_to admin_films_path
  end


  private

  def load_films
    @film = Film.find_by id: params[:id]
    return if @film
    flash[:danger] = t("flash.load_film") + "#{params[:id]}"
    redirect_to root_path
  end

  def film_params
    params.require(:film).permit :name, :play_time, :link_trailer, :image, :imdb_rate,
      :describe, :status, categories_attributes: [:id, :content, :_destroy],
      watching_days_attributes: [:id, :day_watching, :_destroy,
      watching_times_attributes: [:id, :time, :total_ticket, :price, :_destroy]]
  end
end
