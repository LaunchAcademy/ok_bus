class Admin::UsersController < ApplicationController
  before_filter :authorize!
  def index
    @users = User.order("name").page(params[:page]).per(3)
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "User successfully deleted"
      redirect_to "/admin/users"
    else
      flash[:notice] = "User cannot be deleted"
      redirect_to "/admin/users"
    end
  end
end
