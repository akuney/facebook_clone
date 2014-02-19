class Reply < ActiveRecord::Base
  attr_accessible :author_id, :text, :parent_id, :parent_type

  belongs_to :parent, polymorphic: true
  has_many :likes, as: :post
  has_many :likers, through: :likes, source: :liker

  belongs_to :author, class_name: "User"

  def num_likes
    self.likes.count
  end
end
