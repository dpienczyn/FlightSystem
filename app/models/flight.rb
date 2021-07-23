class Flight < ApplicationRecord
  has_many :reservations, dependent: :destroy

  def self.hours_minutes(time)
    hours = time / 60
    minutes = (time) % 60

    "#{ hours }h #{ minutes }min"
  end
end
