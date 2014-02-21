class ChangeThreadIdToMessageThreadId < ActiveRecord::Migration
  def change
    add_column :messages, :message_thread_id, :integer
    remove_column :messages, :thread_id
    add_index :messages, :message_thread_id
  end
end
