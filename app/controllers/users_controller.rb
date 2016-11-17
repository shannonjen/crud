class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path @user
  end

  def destroy
    puts "PARAMS ARE" + params.inspect
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
