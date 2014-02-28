class DemoPhotosController < ApplicationController
  def create
    Photo.last(4)[0..2].each do |photo|
      photo.destroy
    end

    Photo.create!(
    url: "https://pbs.twimg.com/profile_images/378800000499711388/1cc4499794d9ea042e7b358b37926e04.png",
    uploader_id: 1,
    tagged_user_ids: [2, current_user.id])

    Photo.create!(
    url: "http://www.independent.co.uk/incoming/article6149428.ece/ALTERNATES/w300/Prosser.jpg",
    uploader_id: 3,
    tagged_user_ids: [1, 5, current_user.id]
    )

    Photo.create!(
    url: "http://www.meijer.com/assets/product_images/styles/xlarge/1000453_LWHM_A_400.jpg",
    uploader_id: 5,
    tagged_user_ids: [1, 2, 3, 5, current_user.id]
    )
    # need to have good way to deal with multiples

    if request.xhr?
      render partial: 'demo_photos/tagged', locals: {:user => current_user}
    else
      render json: {hi: 'hi'}
    end
  end
end
