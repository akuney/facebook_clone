class Comment < ActiveRecord::Base
  attr_accessible :author_id, :text, :recipient_id

  has_many :replies, as: :parent, dependent: :destroy
  has_many :likes, as: :post, dependent: :destroy
  has_many :likers, through: :likes, source: :liker

  belongs_to :author, class_name: "User"
  belongs_to :recipient, class_name: "User"

  belongs_to :photo

  def num_likes
    self.likes.count
  end
end
