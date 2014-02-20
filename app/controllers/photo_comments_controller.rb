class PhotoCommentsController < ApplicationController
  def edit
    @photo_comment = PhotoComment.find(params[:id])
  end

  def update
    @photo_comment = PhotoComment.find(params[:id])
    @photo_comment.update_attributes(params[:photo_comment])
    @photo_comment.save!

    redirect_to photo_url(@photo_comment.photo)
  end
end
