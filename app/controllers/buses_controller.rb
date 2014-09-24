class BusesController < ApplicationController
  def index
    @buses = Bus.order(:number)
    @users = User.all
  end

  def show
    @bus = Bus.find(params[:id])
  end
end
