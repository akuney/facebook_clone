class Friendship < ActiveRecord::Base
  attr_accessible :first_friend_id, :second_friend_id

  belongs_to :user
  belongs_to :friend, :class_name => "User"
end
