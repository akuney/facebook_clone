class PendingFriendship < ActiveRecord::Base
  attr_accessible :user_id, :pending_friend_id

  belongs_to :user
  belongs_to :pending_friend, :class_name => "User"
end
