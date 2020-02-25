class CarsController < ApplicationController


  def show
    @car = Car.find(params[:id])
  end

  def self.search(search)
    if search
      car_kind = Car.find_by(kind: search)
        if car_kind
          self.where(car_id: car_kind)
        else
          @cars=Car.all
        end
    else
      @cars = Car.all
    end
  end

end
