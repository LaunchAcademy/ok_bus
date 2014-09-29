class BusesController < ApplicationController
  def index
    @buses = Bus.order(:number).page(params[:page]).per(3)
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc)
  end
end
