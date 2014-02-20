class Photo < ActiveRecord::Base
  attr_accessible :url, :uploader_id, :tagged_user_ids

  belongs_to :uploader, class_name: "User"
  has_many :photo_taggings
  has_many :tagged_users, through: :photo_taggings, source: :user
end
