class PhotoTaggingsController < ApplicationController
  def destroy
    @photo_tagging = PhotoTagging.find(params[:id])
    @photo = Photo.find(@photo_tagging.photo_id)

    @photo_tagging.destroy

    redirect_to photo_url(@photo)
  end

  def create
    @photo_tagging = PhotoTagging.new(params[:photo_tagging])
    @photo_tagging.save!

    redirect_to photo_url(@photo_tagging.photo_id)
  end

end
