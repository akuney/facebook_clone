class PhotoComment < ActiveRecord::Base
  has_many :replies, as: :parent, dependent: :destroy
  has_many :likes, as: :post, dependent: :destroy
  has_many :likers, through: :likes, source: :liker

  belongs_to :photo

  def num_likes
    self.likes.count
  end
end
