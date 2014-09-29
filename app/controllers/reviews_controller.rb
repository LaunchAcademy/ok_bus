class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @bus = Bus.find(params[:bus_id])
    @rides = @bus.rides
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @bus = @review.ride.bus

    if @review.save
      redirect_to bus_path(@bus),
      notice: "Review successfully created."
    else
      render "new"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @bus = @review.ride.bus
  end

  def update
    @review = Review.find(params[:id])
    @bus = @review.ride.bus

    if @review.update(review_params)
      redirect_to bus_path(@review.ride.bus),
      notice: "Review successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @bus = @review.ride.bus
    @review.destroy
    redirect_to bus_path(@bus),
    notice: "Review successfully deleted."
  end


private

  def review_params
    params.require(:review).permit(
      :ride_id,
      :rating,
      :body
      ).merge(user: current_user)
  end
end
