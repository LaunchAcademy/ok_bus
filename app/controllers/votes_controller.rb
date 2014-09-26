class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @review = Review.find(params[:review_id])
    @bus = @review.ride.bus
    @vote = Vote.new(review_id: @review.id,
                     direction: params[:direction],
                     user_id: current_user.id
                     )
    redirect_to bus_path(@bus), notice: "Voted!"
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
end
