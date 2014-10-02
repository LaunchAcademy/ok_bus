class Admin::UsersController < ApplicationController
  before_filter :authorize!
  def index
    @users = User.where.not(id: current_user.id).order(:username).page(params[:page]).per(25)
  end

  def update_role
    user = User.find(params[:id])
    user.toggle!(:admin)
    if user.admin?
      flash[:notice] = "#{user.username} is now an admin"
    else
      flash[:notice] = "#{user.username} is no longer an admin"
    end
    redirect_to "/admin/users"
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
