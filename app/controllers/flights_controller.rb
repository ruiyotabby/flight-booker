class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:departure_airport, :arrival_airport).all
    retrieve_departure_options
    retrieve_arrival_options
    retrieve_start_options
    perform_flight_search if request.query_parameters[:commit]
  end

  private

  def retrieve_departure_options
    @departure_options = @flights.map { |f| [f.departure_airport.code, f.departure_airport.id] }
  end

  def retrieve_arrival_options
    @arrival_options = @flights.map { |f| [f.arrival_airport.code, f.arrival_airport.id] }
  end

  def retrieve_start_options
    @start_options = @flights.map { |f| [f.start.to_fs(:long), f.start] }
  end

  def perform_flight_search
    @query = request.query_parameters[:flight]
    @found_flights = Flight.matching_airports_and_start(
      @query[:departure_airport_id], @query[:arrival_airport_id], @query[:start]
    )
  end
end
