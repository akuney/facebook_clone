class Message < ActiveRecord::Base
  attr_accessible :author_id, :thread_id, :title

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :thread, class_name: "MessageThread", foreign_key: "thread_id"
end
