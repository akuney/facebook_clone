class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.save!
    redirect_to new_profile_url
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update_attributes(params[:profile])
    redirect_to new_profile_url
  end

  def show
    @user = current_user
  end
end
