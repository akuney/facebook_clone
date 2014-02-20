class PhotosController < ApplicationController
  def new
  end

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.save!

    @photo_comment = PhotoComment.new(params[:photo_comment])
    @photo_comment.photo_id = @photo.id
    @photo_comment.save!

    redirect_to user_photos_url(current_user)
  end
end
