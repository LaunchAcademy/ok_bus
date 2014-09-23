class BusesController < ApplicationController
  def index
    @buses = Bus.all.order(number: :asc)
  end
end
