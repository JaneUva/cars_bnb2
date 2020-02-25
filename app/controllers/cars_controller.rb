class CarsController < ApplicationController

  def index
   if params[:query].present?
      @cars = Car.where("brand ILIKE?", "%#{params[:query]}%")
   else
      @cars = Car.all
    end
  end

  def show
    @car = Car.find(params[:id])
  end


end
