class Like < ActiveRecord::Base
  attr_accessible :liker_id

  belongs_to :post, polymorphic: true
end
