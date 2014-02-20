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
  end
end
