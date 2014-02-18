class Reply < ActiveRecord::Base
  attr_accessible :author_id, :text

  belongs_to :parent, polymorphic: true
end
