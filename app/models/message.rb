class Message < ActiveRecord::Base
  attr_accessible :author_id, :thread_id, :text

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :message_thread
end
