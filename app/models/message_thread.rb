class MessageThread < ActiveRecord::Base
  attr_accessible :creator_id, :title, :recipient_ids

  belongs_to :creator, class_name: "User"

  has_many :user_message_threads
  has_many :recipients, through: :user_message_threads, source: :recipient
  has_many :messages, foreign_key: :message_thread_id, dependent: :destroy

  def num_recipients
    self.recipients.count
  end
end
