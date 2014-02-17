class ChangeNamesOfColumnsInFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :user_id, :integer
    add_column :friendships, :friend_id, :integer
    remove_column :friendships, :first_friend_id
    remove_column :friendships, :second_friend_id
  end
end
