class BusesController < ApplicationController
  def index
    if params[:search]
      @buses = Bus.search(params[:search]).order(:number).page(params[:page]).per(25)
    else
      @buses = Bus.order(:number).page(params[:page]).per(25)
    end
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc)
  end
end
