class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def edit
    @user = get_user
  end

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

  def destroy
    @user = get_user
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Your account was deleted"
    redirect_to users_path
  end

  private

  def get_user
    User.find(params[:id])
  end

end
