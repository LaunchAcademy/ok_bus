class BusesController < ApplicationController
  def index
    @buses = Bus.order(:number)
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc)
  end
end
