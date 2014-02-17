class CreatePendingFriendships < ActiveRecord::Migration
  def change
    create_table :pending_friendships do |t|
      t.integer :first_friend_id
      t.integer :second_friend_id

      t.timestamps
    end
  end
end
