class BookingsController < ApplicationController
  def listings
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end
  def new
    @booking = Booking.find(params[:booking_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @booking = Booking.new(booking_params)
    @booking.booking = @booking
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy

    redirect_to booking_path(@booking.booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :booking_start_time, :booking_end_time, :status)
  end
end
