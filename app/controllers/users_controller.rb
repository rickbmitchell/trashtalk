class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Welcome!"
      redirect_to user_path @user
    else
      flash[:alert] = "Your team sucks!"
      redirect_to 'user/new'
    end
  end

  def show
    @user = get_user
  end

  def get_user
    User.find(params[:id])
  end

end
