class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = current_user.id

    if @vehicle.save
      redirect_to vehicles_path
    else
      render :new
    end
  end

    def show
    @vehicle = Vehicle.find(params[:id])
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :photo, :description, :model, :brand, :rent_cost_per_day)
  end
end
