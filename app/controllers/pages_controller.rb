class PagesController < ApplicationController
  def home
    @movie_title = ScrapingImdb.new.title
    @posts_pending = PostReview.pending.newest.paginate page: params[:page],
     per_page: Settings.paginate_number.per_page
  end

  def about
  end

  def help
  end
end
