class Passenger < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, length: { minimum: 2, maximum: 50 }

  belongs_to :booking
end
