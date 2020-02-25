class CarsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
     if params[:query].present?
       @cars = Car.where("brand ILIKE?", "%#{params[:query]}%")
     else
       @cars = policy_scope(Car)
     end
  end

  def show
    @booking = Booking.new
    @car = Car.find(params[:id])
    authorize @car
  end
end
