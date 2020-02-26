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

  # def analyze_query
  #   if Car.brands.include? "#{params[:query]}"
  #     @cars = Car.where("brand ILIKE?", "%#{params[:query]}%")
  #   else
  #     @cars = Car.near(params[:query], 10)
  #   end
  # end
end
