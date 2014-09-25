class Admin::UsersController < ApplicationController
  before_filter :authorize!
  def index
    binding.pry
    @users = User.all
  end
end
