class ProfilesController < ApplicationController

  def show
    @profile = get_profile
  end

  def edit
    @profile = get_profile
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path, notice: "New post created."
    else
      render :new
    end
  end

private

  def get_profile
    Profile.find(params[:id])
  end

  def profile_params
    params.require(:fname, :lname).permit(:bio).merge(user: current_user)
  end

end
