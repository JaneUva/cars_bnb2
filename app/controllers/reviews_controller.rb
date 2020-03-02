class ReviewsController < ApplicationController
  def create
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @review = Review.new(review_params)
    @review.car = @car
    @review.user_id = current_user.id
    authorize @review
   if @review.save
    # The code below alows to append messages to review with or without JS enabled
      respond_to do |format|
        format.html { redirect_to car_path(@car) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'cars/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
