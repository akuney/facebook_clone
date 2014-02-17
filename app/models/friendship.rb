class Friendship < ActiveRecord::Base
  attr_accessible :first_friend_id, :second_friend_id

  belongs_to :first_friend, class_name: :user, foreign_key: :first_friend_id
  belongs_to :second_friend, class_name: :user, foreign_key: :second_friend_id
end
