class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = get_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      Profile.create(user_id: @user.id)
      current_user
      flash[:notice] = "Welcome!"
      redirect_to login_path
    else
      flash[:alert] = "Your team sucks!"
      redirect_to 'users/new'
    end
  end

  def show
    @user = get_user
    @profile = get_profile
  end

  def destroy
    @user = get_user
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Your account was deleted"
    redirect_to '/'
  end

  private

  def get_user
    User.find(params[:id])
  end

  def get_profile
    Profile.find(params[:id])
  end

end
