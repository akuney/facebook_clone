class ChangeNamesOfColumnsInPendingFriendships < ActiveRecord::Migration
  def change
    add_column :pending_friendships, :user_id, :integer
    add_column :pending_friendships, :pending_friend_id, :integer
    remove_column :pending_friendships, :first_friend_id
    remove_column :pending_friendships, :second_friend_id
  end
end
