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

  def mapper
    @vehicles = Vehicle.all

    @markers = @vehicles.geocoded.map do |vehicle|
        {
          lat: vehicle.latitude,
          lng: vehicle.longitude,
          info_window: render_to_string(partial: "info_window", locals: { vehicle: vehicle })
        }
      end
    end


  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :photo, :description, :model, :brand, :rent_cost_per_day)
  end

end
