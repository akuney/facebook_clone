class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.integer :creator_id
      t.string :title
      t.timestamps
    end
  end
end
