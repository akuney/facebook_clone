class Comment < ActiveRecord::Base
  attr_accessible :author_id, :text, :recipient_id

  has_many :replies, as: :parent, dependent: :destroy
  has_many :likes, as: :post, dependent: :destroy
  has_many :likers, through: :likes, source: :liker

  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :recipient, class_name: "User"


  def num_likes
    self.likes.count
  end

  def recent_activities
    self.replies.where(created_at: (Time.now - 604800)..(Time.now)) +
    self.likes.where(created_at: (Time.now - 604800)..(Time.now))
  end
end
