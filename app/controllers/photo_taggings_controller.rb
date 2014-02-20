class PhotoTaggingsController < ApplicationController
  def destroy
    @photo = Photo.find(params[:photo])

  end
end
