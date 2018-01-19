class Admin::PostReviewsController < Admin::BaseController
  before_action :load_post, except: [:index, :new, :create]

  def index
    @posts = PostReview.order("created_at desc").paginate page: params[:page],
     per_page: Settings.paginate_number.per_page
    @posts_approved = PostReview.approved.newest.paginate page: params[:page],
     per_page: Settings.paginate_number.per_page
    @posts_pending = PostReview.pending.newest.paginate page: params[:page],
     per_page: Settings.paginate_number.per_page
  end

  def new
    @post = PostReview.new
  end

  def create
    @post = current_user.post_reviews.build post_params
    @post.approve = true
    if @post.save
      flash[:success] = t "flash.create_post_success"
    else
      flash[:danger] = t "flash.create_post_fail"
    end
    redirect_to admin_post_reviews_path
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t "flash.update_success"
    else
      flash[:danger] = t "flash.update_fail"
    end
    redirect_to admin_post_reviews_path
  end

  def destroy
    if @post.destroy
      flash[:success] = t "flash.destroy_post_success"
    else
      flash[:danger] = t "flash.destroy_post_fail"
    end
    redirect_to admin_post_reviews_path
  end

  private

  def load_post
    @post = PostReview.find_by id: params[:id]
    return if @post
    flash[:danger] = t "flash.post_load_fail"
    redirect_to admin_post_reviews_path
  end

  def post_params
    params.require(:post_review).permit :title, :content, :approve, :image
  end
end
