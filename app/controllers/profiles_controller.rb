class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def edit
    @profile = get_profile
  end

  def create
  end

  def update
    user = current_user
    if user.profile.update(params[:profile])
      redirect_to user_path(user), notice: "Profile updated."
    else
      render :new, alert: "There was a problem."
    end
  end

  private

  def get_profile
    current_user.profile
  end

  # def profile_params
  #   params.require(:profile).permit(:fname, :lname, :bio).merge(user: current_user)
  # end

end
