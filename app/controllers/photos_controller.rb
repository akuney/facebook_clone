class PhotosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @photo = Photo.find(params[:id])
  end
end
