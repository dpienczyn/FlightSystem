class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = flight.reservations
  end

  private

  def flight
    @flight ||= Flight.find(params[:flight_id])
  end
end
