class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all

    # search results
    if params[:query].present?
      @results = Vehicle.search_by_name_model_and_brand(params[:query])
    else
      @results = Vehicle.all
    end

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
          info_window: render_to_string(partial: "info_window", locals: { vehicle: vehicle }),
          image_url: helpers.asset_url('auto_marker.png')
        }
      end
    end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :photo, :description, :model, :brand, :rent_cost_per_day)
  end

end
