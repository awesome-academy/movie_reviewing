class SearchsController < ApplicationController
  def index
    @posts = PostReview.ransack(title_cont: params[:q]).result(distinct: true).limit(4)
    @films = Film.ransack(name_cont: params[:q]).result(distinct: true).limit(4)

    respond_to do |format|
      format.html {}
      format.json {
        @films
        @posts
      }
    end
  end
end
