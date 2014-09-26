class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @review = Review.find(params[:review_id])
    @bus = @review.ride.bus
    @vote = Vote.new(review_id: params[:review_id],
                     direction: params[:direction],
                     user_id: current_user.id
                     )
    if @vote.save
      redirect_to bus_path(@bus), notice: "Voted!"
    else
      redirect_to bus_path(@bus), notice: "Already voted!"
    end
  end
end
