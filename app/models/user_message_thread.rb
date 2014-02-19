class UserMessageThread < ActiveRecord::Base
  attr_accessible :message_thread_id, :recipient_id

  belongs_to :message_thread
  belongs_to :recipient, class_name: "User"
end
