class BusesController < ApplicationController
  def index
    @number =
    if params[:search]
      @buses = Bus.search(params[:search]).order(:number)
    else
      @buses = Bus.all.sort_by { |a| Bus::order_numbers(a.number) }
    end
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc)
  end
end
