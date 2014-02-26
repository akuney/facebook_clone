class PhotoTaggingsController < ApplicationController
  def destroy
    @photo_tagging = PhotoTagging.find(params[:id])

    @photo = Photo.find(@photo_tagging.photo_id)
    @user = User.find(@photo_tagging.user_id)

    @photo_tagging.destroy

    if request.xhr?
      render partial: 'photos/untagged_friend',
      locals: {user: @user, photo: @photo}
    else
      redirect_to photo_url(@photo)
    end
  end

  def create
    @photo_tagging = PhotoTagging.new(params[:photo_tagging])
    @photo_tagging.save!

    if request.xhr?
      render json: {hi: "hi"}
    else
      redirect_to photo_url(@photo_tagging.photo_id)
    end
  end

end
