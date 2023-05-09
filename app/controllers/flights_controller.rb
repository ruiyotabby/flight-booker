class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:departure_airport, :arrival_airport).all
    @departure_options = @flights.map { |f| [f.departure_airport.code, f.departure_airport.id] }
    @arrival_options = @flights.map { |f| [f.arrival_airport.code, f.arrival_airport.id] }
    @start_options = @flights.map { |f| [f.start.to_fs(:long), f.id] }
  end
end
