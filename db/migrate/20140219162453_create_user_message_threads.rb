class CreateUserMessageThreads < ActiveRecord::Migration
  def change
    create_table :user_message_threads do |t|
      t.integer :message_thread_id
      t.integer :recipient_id
      t.timestamps
    end
  end
end
