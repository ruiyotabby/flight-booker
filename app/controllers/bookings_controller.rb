class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    params[:tickets].to_i.times{ @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    puts booking_params

    if @booking.save
      @booking.passengers.each { |passenger| PassengerMailer.with(passenger: passenger).confirm_booking.deliver }
      redirect_to flights_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:_destroy, :id, :name, :email])
  end
end