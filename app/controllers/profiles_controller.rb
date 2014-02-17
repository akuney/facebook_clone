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
  end

  def update
  end

  def show
  end
end
