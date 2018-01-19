class Admin::AdminController < Admin::BaseController
  def index
    @new_users = User.new_users.desc_create_time.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
    @new_post_reviews = PostReview.new_post_reviews.newest.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
    @new_bookings = Booking.new_bookings.desc_create_time.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
    @new_comments = Comment.new_comments.desc_create_at.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
  end
end
