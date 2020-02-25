class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @cars = policy_scope(Car).order(:name)
  end

  def show
    @car = Car.find(params[:id])
    authorize @car
  end
end
