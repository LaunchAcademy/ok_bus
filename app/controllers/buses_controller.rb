class BusesController < ApplicationController
  def index
    if params[:search]
      @buses = Bus.search(params[:search]).order(:number).page(params[:page]).per(25)
    else
      @buses = Bus.all.sort_by(&:order_number)
      @buses = Kaminari.paginate_array(@buses).page(params[:page]).per(25)
    end
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc).page(params[:page]).per(5)
  end
end
