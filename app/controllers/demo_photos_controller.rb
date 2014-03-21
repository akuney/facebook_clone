class DemoPhotosController < ApplicationController
  def create
    current_user.photos_tagged_in.each do |photo|
      photo.destroy
    end

     # make sure to create the new photo first

    Photo.destroy_all(url: "https://pbs.twimg.com/profile_images/378800000499711388/1cc4499794d9ea042e7b358b37926e04.png")

    Photo.create!(
    url: "https://pbs.twimg.com/profile_images/378800000499711388/1cc4499794d9ea042e7b358b37926e04.png",
    uploader_id: 1,
    tagged_user_ids: [2, current_user.id])

    PhotoComment.create!(
    photo_id: Photo.last.id,
    text: "This is the world!!!"
    )

    Like.create!(
    liker_id: 2,
    post_type: "PhotoComment",
    post_id: PhotoComment.last.id
    )

    Reply.create!(
    author_id: 3,
    parent_type: "PhotoComment",
    parent_id: PhotoComment.last.id,
    text: "That's it? There must be more..."
    )

    Like.create!(
    liker_id: 1,
    post_type: "Reply",
    post_id: Reply.last.id
    )

    Like.create!(
    liker_id: 5,
    post_type: "Reply",
    post_id: Reply.last.id
    )

    Photo.destroy_all(url: "http://www.independent.co.uk/incoming/article6149428.ece/ALTERNATES/w300/Prosser.jpg")

    Photo.create!(
    url: "http://www.independent.co.uk/incoming/article6149428.ece/ALTERNATES/w300/Prosser.jpg",
    uploader_id: 3,
    tagged_user_ids: [1, 5, current_user.id]
    )

    Photo.destroy_all(url: "http://www.meijer.com/assets/product_images/styles/xlarge/1000453_LWHM_A_400.jpg")

    Photo.create!(
    url: "http://www.meijer.com/assets/product_images/styles/xlarge/1000453_LWHM_A_400.jpg",
    uploader_id: 5,
    tagged_user_ids: [1, 2, 3, 5, current_user.id]
    )
    # need to have good way to deal with multiples

    redirect_to tagged_user_photos_url(current_user)

    # if request.xhr?
#       render partial: 'demo_photos/tagged', locals: {:user => current_user}
#     else
#       render json: {hi: 'hi'}
#     end
  end
end
