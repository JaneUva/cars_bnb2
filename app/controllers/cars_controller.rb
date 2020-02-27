class CarsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  @cars = policy_scope(Car).geocoded
   if params[:query].present?
    @cars = Car.near(params[:query])
   else
     @cars
   end
  @markers = @cars.map do |car|
    {
      lat: car.latitude,
      lng: car.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { car: car })
    }
  end

  end

  def show
    @booking = Booking.new
    @car = Car.find(params[:id])
    @review = Review.new
    authorize @car
  end

  private

  def set_car_params
    params[:car].permit(:kind, :brand, :capacity, :price, :drive_train, :location, :description, :photo)
  end
end
