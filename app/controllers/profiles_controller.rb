class ProfilesController < ApplicationController

  def show
    @profile = get_profile
  end

  def get_profile
    Profile.find(params[:id])
  end

end
