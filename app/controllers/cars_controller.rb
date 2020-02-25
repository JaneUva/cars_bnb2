class CarsController < ApplicationController

  def index
   if params[:query].present?
      @cars = Car.where("brand ILIKE?", "%#{params[:query]}%")
   else
      @cars = policy_scope(Car)
    end
  end

  def show
    @car = Car.find(params[:id])
  end


end
