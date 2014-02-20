class PhotoCommentsController < ApplicationController
  def edit
    @photo_comment = PhotoComment.find(params[:photo_comment])
  end

  def update
    @photo_comment = PhotoComment.find(params[:id])
    @photo_comment.update_attributes
    @photo_comment.save!

    redirect_to photo_url(@photo_comment.photo)
  end
end
