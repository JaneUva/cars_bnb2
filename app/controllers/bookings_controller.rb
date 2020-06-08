class BookingsController < ApplicationController
  before_action :set_car, except: [:destroy, :show, :index]

  def index
    @bookings = policy_scope(Booking)
    @bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(set_params)
    @review = Review.new
    @booking.car = @car
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'cars/show'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to bookings_path, notice: 'Booking was successfully canceled'
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_params
    params[:booking].permit(:start_date, :end_date)
  end
end
