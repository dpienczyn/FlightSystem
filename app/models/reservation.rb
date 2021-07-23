class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  validates :number, uniqueness: { scope: :flight_id }
  validate :validate_number_of_seats

  private

  def validate_number_of_seats
    return unless flight
    return if flight.number_of_seats > flight.reservations.count

    errors.add(:number_of_seats, 'została przekroczona')
  end
end
