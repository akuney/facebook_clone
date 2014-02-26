class Like < ActiveRecord::Base
  attr_accessible :liker_id, :post_id, :post_type

  belongs_to :post, polymorphic: true
  belongs_to :liker, class_name: "User", foreign_key: "liker_id"

  validates_uniqueness_of :post_id, scope: [:liker_id]

  def self.find_by_liker_and_post(liker, post_id, post_type)
    Like.where(liker_id: liker.id, post_id: post_id, post_type: post_type).first || []
  end
end
