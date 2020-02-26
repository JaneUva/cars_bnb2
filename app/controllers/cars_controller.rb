class CarsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  @cars = policy_scope(Car).geocoded
  @markers = @cars.map do |car|
    {
      lat: car.latitude,
      lng: car.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { car: car })
    }
  end

   if params[:query].present?
     @cars = Car.where("brand ILIKE?", "%#{params[:query]}%")
   else
     @cars
   end
  end

  def show
    @booking = Booking.new
    @car = Car.find(params[:id])
    authorize @car
  end
end
