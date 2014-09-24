class ReviewsController < ApplicationController
  def new
    @bus = Bus.find(params[:bus_id])
    @rides = @bus.rides
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @bus = @review.ride.bus

    if @review.save
      redirect to bus_path(@bus)
    else
      render 'new'
    end
  end
end
