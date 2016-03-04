class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def show
    @profile = get_profile
  end

  def edit
    @profile = get_profile
  end

  def create
    @profile = Profile.new(profile_params)
    @user = current_user
    if @profile.save
      @profile.user_id = session[:user_id]
      @profile.save
      redirect_to @user, notice: "Profile created."
    else
      redirect_to new_profile_path, alert: "There was a problem."
    end
  end

  def update
    @profile = Profile.new
    @user = current_user
    if @profile.update_attributes(params[:profile])
      @profile.user_id = session[:user_id]
      redirect_to @user, notice: "Profile updated."
    else
      render :new, alert: "There was a problem."
    end
  end

private

  def get_profile
    Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:fname, :lname, :bio).merge(user: current_user)
  end

end
