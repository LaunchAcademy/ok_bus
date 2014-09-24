class ReviewsController < ApplicationController
  def new
    @bus = Bus.find(params[:bus_id])
    @rides = @bus.rides
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @bus = @review.ride.bus
    @review.user_id = session[:user_id]

    if @review.save
      redirect to bus_path(@bus)
    else
      render "new"
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review
    else
      render "edit"
    end
  end
end

private

def review_params
  params.require(:review).permit(:ride_id, :rating, :body)
end
