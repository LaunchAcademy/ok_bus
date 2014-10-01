class BusesController < ApplicationController
  def index
    if params[:search]
      @buses = Bus.search(params[:search]).order(:number)

      if @buses.empty?
        @buses = Bus.order(:number)
        flash[:notice] = "Could not find your search term"
      end
    else
      @buses = Bus.all.sort_by(&:order_number)
    end
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc)
  end
end
