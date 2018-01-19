class Admin::BookingsController < Admin::BaseController
  def index
    @bookings = Booking.desc_create_time.paginate page: params[:page],
      per_page: Settings.paginate_number.per_page
  end

  def destroy
    @booking = Booking.find_by id: params[:id]
    if @booking.destroy
      flash[:success] = t "flash.destroy_booking_success"
    else
      flash[:danger] = t "flash.destroy_booking_fail"
    end
    redirect_to admin_bookings_path
  end
end
