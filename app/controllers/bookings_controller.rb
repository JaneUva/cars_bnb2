class BookingsController < ApplicationController
  before_action :set_car, except: [:destroy, :show, :index]

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def create
    @booking = Booking.new(set_params)
    @booking.car = @car
    @booking.user_id = current_user.id
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :template => 'cars/show'
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
    redirect_to car_path(@booking.car), notice: 'Booking was successfully canceled'
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_params
    params[:booking].permit(:start_date, :end_date, :car_id, :user_id)
  end
end
