class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:description, :model, :rent_cost_per_day)
  end
end
