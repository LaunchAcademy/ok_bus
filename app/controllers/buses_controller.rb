class BusesController < ApplicationController
  def index
    @buses = Bus.order(:number).page(params[:page]).per(15)
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc).page(params[:page]).per(5)
  end
end
