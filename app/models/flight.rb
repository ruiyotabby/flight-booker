class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"
  # validates :start, presence: true
  # validates :duration, presence: true
  has_many :bookings

  scope :matching_airports_and_start, ->(departure_airport_id, arrival_airport_id, start) {
    where(departure_airport_id: departure_airport_id, arrival_airport_id: arrival_airport_id, start: start)}
end
