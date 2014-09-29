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
end
