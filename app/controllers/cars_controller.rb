class CarsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  @cars = policy_scope(Car)
     if params[:query].present?
       @cars = Car.where("brand ILIKE?", "%#{params[:query]}%")
     else
       @cars
     end
  end

  def show
    @booking = Booking.new
    @car = Car.find(params[:id])
    @review = Review.new
    authorize @car
  end
end
