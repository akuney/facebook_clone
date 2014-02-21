class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.integer :thread_id
      t.text :text
      t.timestamps
    end
  end
end
