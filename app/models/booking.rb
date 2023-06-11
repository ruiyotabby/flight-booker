class Booking < ApplicationRecord
  belongs_to :flight, class_name: 'Flight', foreign_key: 'flight_id'
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, allow_destroy: true
end
