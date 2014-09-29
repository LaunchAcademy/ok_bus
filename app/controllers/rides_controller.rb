class RidesController < ApplicationController
  def new
    @bus = Bus.find(params[:bus_id])
    @rides = @bus.rides
    @ride = Ride.new
    @review = Review.new
    @review.ride
  end
  def create
    @review = Review.new(review_params)
    @bus = @review.ride.bus

    if @review.save
      redirect_to bus_path(@bus), notice: "Review successfully created."
    else
      render "new"
    end
  end
end
