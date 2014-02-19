class MessageThread < ActiveRecord::Base
  attr_accessible :creator_id, :title

  belongs_to :creator, class_name: "User"

  has_many :user_message_threads
  has_many :recipients, through: :user_message_threads, source: :recipient

  def num_recipients
    self.recipients.count
  end
end
