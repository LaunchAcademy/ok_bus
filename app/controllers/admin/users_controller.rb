class Admin::UsersController < ApplicationController
  before_filter :authorize!
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to "index"
    end
  end
end
