class PendingFriendship < ActiveRecord::Base
  attr_accessible :first_friend_id, :second_friend_id

  def self.requests_sent(user)
    return PendingFriendship.where('first_friend_id = ?', user.id)
  end

  def self.requests_received(user)
    return PendingFriendship.where('second_friend_id = ?', user.id)
  end
end
