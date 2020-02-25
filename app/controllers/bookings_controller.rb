class BookingsController < ApplicationController
  before_action :set_car, except: :destroy
  def create
    @booking = Booking.new(set_params)
    @booking.car = @car
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :show
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_params
    params[:booking].permit(:start_date, :end_date, :car_id, :user_id)
  end

end
