class PassengerMailer < ApplicationMailer

  def confirm_booking
    @passenger = params[:passenger]
    @url = 'https://127.0.0.1:3000'
    mail(to: @passenger.email, subject: 'Flight Booked')
  end
end
