class BusesController < ApplicationController
  def index
<<<<<<< HEAD
    @buses = Bus.order(:number).page(params[:page]).per(25)
=======
    if params[:search]
      @buses = Bus.search(params[:search]).order(:number)
    else
      @buses = Bus.order(:number)
    end
>>>>>>> 0f2e3170fbe13f3927545509b1ba7fb2e7d717da
  end

  def show
    @bus = Bus.find(params[:id])
<<<<<<< HEAD
    @reviews = @bus.reviews.order(created_at: :desc).page(params[:page]).per(5)
=======
    @reviews = @bus.reviews.order(created_at: :desc)
#    binding.pry
>>>>>>> 0f2e3170fbe13f3927545509b1ba7fb2e7d717da
  end
end
