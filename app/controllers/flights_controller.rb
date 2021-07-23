class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:reservations).all.map do |flight|
      flight.as_json(include: :reservations)
    end
  end
end
