class Reply < ActiveRecord::Base
  attr_accessible :author_id, :text

  belongs_to :parent, polymorphic: true
  has_many :likes, as: :post

  belongs_to :author, class_name: "User"
end
