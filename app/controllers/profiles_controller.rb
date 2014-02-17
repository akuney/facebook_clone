class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.save!
    redirect_to profile_url(@profile)
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile.update_attributes(params[:profile])
  end

  def show
    @user = current_user
  end
end
