class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @reviews = Review.order(created_at: :desc)
  end

  def new
    @bus = Bus.find(params[:bus_id])
    @rides = @bus.rides
    @review = Review.new
  end

  def create
    @ride = Ride.find_by(ride_params)
    @review = Review.new((review_params).merge(ride_id: @ride.id))
    @bus = @ride.bus

    if @review.save
      redirect_to bus_path(@bus),
        notice: "Review successfully created."

      UserMailer.review_email(@review).deliver
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
    @ride = Ride.find_by(ride_params)
    @bus = @review.ride.bus

    if @review.update((review_params).merge(ride_id: @ride))
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

  def authorize_to_edit!
    review = Review.find(params[:id])
    if current_user.nil? || !current_user.authorized_to_edit?(review)
      flash[:notice] = "You must be an admin to access this!"
      redirect_to root_path
    end
  end

private

  def review_params
    params.require(:review).permit(
      :rating,
      :body
      ).merge(user: current_user)
  end

  def ride_params
    params.require(:ride).permit(
      :timeframe,
      :day,
      :direction
      ).merge(bus_id: params[:bus_id])
  end
end
