class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user and @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
      flash[:alert] = "Incorrect login."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_to '/login'
  end

end
