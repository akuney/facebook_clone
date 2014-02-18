class Status < ActiveRecord::Base
  attr_accessible :author_id, :text

  has_many :replies, as: :parent
  has_many :likes, as: :post, foreign_key: "post_id"
  has_many :likers, through: :likes, source: :liker

  belongs_to :author, class_name: "User"

  def num_likes
    self.likes.count
  end
end
