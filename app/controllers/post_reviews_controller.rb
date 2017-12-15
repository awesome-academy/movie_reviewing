class PostReviewsController < ApplicationController
  before_action :load_post, except: [:index, :new, :create]

  def index
    @posts = PostReview.paginate page: params[:page],
     per_page:
      Settings.paginate_number.per_page
  end

  def new
    @post = PostReview.new
  end

  def create
    @post = current_user.post_reviews.build post_params
    if @post.save
      flash[:success] = t "flash.create_post_success"
      redirect_to post_review_path @post
    else
      flash[:danger] = t "flash.create_post_fail"
      redirect_to user_path current_user
    end
  end

  def update
    @user = User.find_by params[:user_id]
    if @post.update_attributes post_params
      flash[:success] = t "flash.update_success"
    else
      flash[:danger] = t "flash.update_fail"
    end
    redirect_to post_review_path @post
  end

  def destroy
    if @post.destroy
      flash[:success] = t "flash.destroy_success"
    else
      flash[:danger] = t "flash.destroy_fail"
    end
    redirect_to user_path current_user
  end

  def show
  end

  private

  def load_post
    @post = PostReview.find_by id: params[:id]
    return if @post
    flash[:danger] = t "flash.post_update_success"
    redirect_to root_path
  end

  def post_params
    params.require(:post_review).permit :title, :content
  end
end
