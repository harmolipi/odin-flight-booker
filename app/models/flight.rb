class Flight < ApplicationRecord
  validates :flight_number, :from_airport_id, :to_airport_id, :departure, :duration, presence: true

  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'
  has_many :bookings, dependent: :destroy
end
