class Booking < ApplicationRecord
  belongs_to :flight, class_name: 'Flight', foreign_key: 'flight_id'
  has_many :passengers, class_name: 'Passenger', foreign_key: 'booking_id'
  accepts_nested_attributes_for :passengers
end
