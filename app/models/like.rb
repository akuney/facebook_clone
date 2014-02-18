class Like < ActiveRecord::Base
  attr_accessible :liker_id

  belongs_to :post, polymorphic: true
  belongs_to :liker, class_name: "User"
end
