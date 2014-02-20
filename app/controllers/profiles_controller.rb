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
    @profile.update_attributes(params[:profile])
    @profile.save!

    @photo = Photo.new
    @photo.url = @profile.photo_url
    @photo.uploader_id = current_user.id
    @photo.save
    # if it fails validation, that's because we have that photo already


    redirect_to user_profile_url(current_user, @profile)
  end

  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end
end
