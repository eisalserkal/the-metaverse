class BookingsController < ApplicationController
  def listings
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @review = Review.new
    @bookings_outgoing = []
    @bookings_incoming = []
    @bookings.each do |booking|
      if booking.space.user == current_user
        @bookings_incoming << booking
      elsif booking.user = current_user
        @bookings_outgoing << booking
      end
    end
  end
  # def new
  #   @space = Space.find(params[:space_id])
  #   @booking = Booking.new
  #   authorize @booking
  # end

  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :booking_start_time, :booking_end_time, :status)
  end
end
