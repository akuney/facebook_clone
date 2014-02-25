class Like < ActiveRecord::Base
  attr_accessible :liker_id, :post_id, :post_type

  belongs_to :post, polymorphic: true
  belongs_to :liker, class_name: "User", foreign_key: "liker_id"

  def self.find_by_liker_and_post(liker, post)
    Like.where(liker_id: liker.id, post_id: post.id, post_type: post.class.to_s).first || []
  end
end
