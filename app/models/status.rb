class Status < ActiveRecord::Base
  attr_accessible :author_id, :text

  has_many :replies, as: :parent, dependent: :destroy
  has_many :likes, as: :post, foreign_key: "post_id", dependent: :destroy
  has_many :likers, through: :likes, source: :liker

  belongs_to :author, class_name: "User"

  def num_likes
    self.likes.count
  end

  def recent_activities
    self.replies.where(created_at: (Time.now - 604800)..(Time.now)) +
    self.likes.where(created_at: (Time.now - 604800)..(Time.now))
  end
end
