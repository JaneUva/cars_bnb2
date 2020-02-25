class CarsController < ApplicationController
  def index
    @cars = policy_scope(Car).order(:name)
  end

  def show
    @car = Car.find(params[:id])
  end
end
