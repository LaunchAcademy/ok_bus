class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @review = Review.find(params[:review_id])
    @bus = @review.ride.bus
    @vote = Vote.new(review: @review,
                     direction: params[:direction],
                     user: current_user
                     )
    if @vote.save
      redirect_to bus_path(@bus), notice: "Voted!"
      UserMailer.vote_email(@review).deliver
    else
      redirect_to bus_path(@bus), notice: "Already voted!"
    end
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.direction == "up"
      @other = "down"
    else
      @other = "up"
    end
    @bus = @vote.review.ride.bus
    @vote.update(review_id: @vote.review.id,
                 user_id: current_user.id,
                 direction: @other
                )
    redirect_to bus_path(@bus), notice: "Vote changed!"
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to bus_path(@vote.review.ride.bus), notice: "Vote deleted!"
  end
end
