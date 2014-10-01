class BusesController < ApplicationController
  def index
    if params[:search]
      @buses = Bus.search(params[:search]).order(:number)
    else
      @buses = Bus.all.sort_by(&:order_numbers)
    end
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc)
    binding.pry
  end
end
