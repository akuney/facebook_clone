class PhotoComment < ActiveRecord::Base
  attr_accessible :text

  has_many :replies, as: :parent, dependent: :destroy
  has_many :likes, as: :post, dependent: :destroy
  has_many :likers, through: :likes, source: :liker

  belongs_to :photo
  has_one :author, through: :photo, source: :uploader

  def num_likes
    self.likes.count
  end
end
