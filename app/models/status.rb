class Status < ActiveRecord::Base
  attr_accessible :author_id, :text

  has_many :replies, as: :parent
  has_many :likes, as: :post
end
