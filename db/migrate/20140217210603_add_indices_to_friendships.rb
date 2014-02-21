class AddIndicesToFriendships < ActiveRecord::Migration
  def change
    add_index :friendships, :first_friend_id
    add_index :friendships, :second_friend_id
  end
end
