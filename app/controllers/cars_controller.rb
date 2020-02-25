class CarsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.new
    @car = Car.find(params[:id])
  end
end
