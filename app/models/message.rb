class Message < ActiveRecord::Base
  attr_accessible :creator_id, :thread_id, :title

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  belongs_to :thread, class_name: "MessageThread", foreign_key: "thread_id"
end
