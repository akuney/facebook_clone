class AddIndicesToPendingFriendships < ActiveRecord::Migration
  def change
    add_index :pending_friendships, :first_friend_id
    add_index :pending_friendships, :second_friend_id
  end
end
