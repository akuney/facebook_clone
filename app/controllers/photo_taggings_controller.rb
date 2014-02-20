class PhotoTaggingsController < ApplicationController
  def destroy
    @photo_tagging = PhotoTagging.find(params[:id])
    @photo = Photo.find(@photo_tagging.photo_id)

    @photo_tagging.destroy

    redirect_to photo_url(@photo)
  end
end
