class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.save!

    @photo = Photo.new
    @photo.url = @profile.photo_url
    @photo.uploader_id = current_user.id
    @photo.save!

    redirect_to user_profile_url(current_user, @profile)
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = Profile.find(params[:id])
    @old_url = @profile.photo_url

    @profile.update_attributes(params[:profile])
    @profile.save!

    if (@old_url != @profile.photo_url)
      @photo = Photo.new
      @photo.url = @profile.photo_url
      @photo.uploader_id = current_user.id
      @photo.save!
    end

    redirect_to user_profile_url(current_user, @profile)
  end

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end
end
