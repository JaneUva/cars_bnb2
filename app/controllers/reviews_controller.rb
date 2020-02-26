class ReviewsController < ApplicationController
  def create
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @review = Review.new(review_params)
    @review.car = @car
    @review.user_id = current_user.id
    authorize @review
    if @review.save
      # Happy path
      redirect_to car_path(@car)
    else
      # Sad path
      render 'cars/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
