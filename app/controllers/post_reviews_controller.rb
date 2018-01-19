class PostReviewsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :load_post, except: [:index, :new, :create]

  def show
    @comments = @post.comments.desc_create_at.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
    @like = @post.likes.find_by user_id: current_user.id
    if current_user != @post.user && !current_user.admin?
      return if @post.approve?
      flash[:danger] = t "flash.permission_access"
      redirect_to root_path
    end
  end

  def index
    @posts = PostReview.paginate page: params[:page],
     per_page: Settings.paginate_number.per_page
  end

  def new
    @post = PostReview.new
  end

  def create
    @post = current_user.post_reviews.build post_params
    if current_user.admin?
      @post.approve = true
    end
    if @post.save
      flash[:success] = t "flash.create_post_success"
      redirect_to post_review_path @post
    else
      flash[:danger] = t "flash.create_post_fail"
      redirect_to user_path current_user
    end
  end

  def update
    if current_user != @post.user && !current_user.admin?
      return if @post.approve?
      flash[:danger] = t "flash.permission_access"
      redirect_to root_path
    else
      if @post.update_attributes post_params
        flash[:success] = t "flash.update_success"
      else
        flash[:danger] = t "flash.update_fail"
      end
      redirect_to post_review_path @post
    end
  end

  def destroy
    if current_user != @post.user && !current_user.admin?
      return if @post.approve?
      flash[:danger] = t "flash.permission_access"
      redirect_to root_path
    else
      if @post.destroy
        flash[:success] = t "flash.destroy_post_success"
      else
        flash[:danger] = t "flash.destroy_post_fail"
      end
      redirect_to user_path current_user
    end
  end

  private

  def load_post
    @post = PostReview.find_by id: params[:id]
    return if @post
    flash[:danger] = t "flash.post_load_fail"
    redirect_to root_path
  end

  def post_params
    params.require(:post_review).permit :title, :content, :approve, :image
  end
end
