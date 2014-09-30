class BusesController < ApplicationController
  def index
    @number =
    if params[:search]
      @buses = Bus.search(params[:search]).order(:number)
    else
      @buses = Bus.all.sort_by{ |a| order_numbers(a.number) }
    end
  end

  def show
    @bus = Bus.find(params[:id])
    @reviews = @bus.reviews.order(created_at: :desc)
  end

  def order_numbers(number)
    if number[0].match(/\d/)
      number.to_i
    else
      number.gsub(/\D/,"9").to_i
    end
  end
end
