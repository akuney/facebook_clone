class PhotoTagging < ActiveRecord::Base
  attr_accessible :user_id, :photo_id

  belongs_to :user
  belongs_to :photo
end
