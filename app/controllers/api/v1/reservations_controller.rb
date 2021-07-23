class Api::V1::ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  # GET /flights or /flights.json
  def index
    render json: reservations
  end

  # POST /flights or /flights.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.flight = flight

    if @reservation.save
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    reservation.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def reservations
      @reservations ||= flight.reservations
    end

    def flight
      @flight ||= Flight.find(params[:flight_id])
    end

    def reservation
      @reservation ||= reservations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:number)
    end
end
