class LocationsController < ApplicationController

  def create
    @tour = Tour.find(params[:tour_id])
    @location = @tour.locations.new(location_params)

    if @location.save
      redirect_to @tour
    end

  end

  def location_params
    params.require(:location).permit(:country, :state)
  end
end
