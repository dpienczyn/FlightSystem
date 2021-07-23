class Api::V1::FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show ]

  def index
    @flights = Flight.all
    render json: @flights
  end

  def show
    render json: @flight
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end
end
