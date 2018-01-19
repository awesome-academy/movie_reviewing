class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @films = Film.film_now_playing
  end

  def create
    @booking = Booking.new booking_params
    @booking.user_id = current_user.id
    @watching_time = @booking.watching_time
    if @booking.quantity
      if @watching_time.remaining_ticket >= @booking.quantity
        if @booking.save
          @booking.sub_remaining_ticket @watching_time
          flash[:success] = t "flash.booking_success"
          redirect_to bookings_path
        else
          flash[:danger] = t "flash.booking_fail"
          redirect_to bookings_path
        end
      else
        flash[:danger] = t "flash.wrong_quantity"
        redirect_to bookings_path
      end
    else
      flash[:danger] = t "flash.quantity_nil"
      redirect_to bookings_path
    end
  end

  def destroy
    @booking = Booking.find_by id: params[:id]
    @watching_time = @booking.watching_time
    @booking.add_remaining_ticket @watching_time
    if @booking.destroy
      render json: {
       status: :success
      }
    else
      @booking.sub_remaining_ticket @watching_time
      render json: {
        status: :error
      }
    end
  end

  private

  def booking_params
    params.require(:booking).permit :watching_time_id, :quantity
  end
end
