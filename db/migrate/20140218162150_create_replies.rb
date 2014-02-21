class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :author_id
      t.integer :comment_id
      t.text :text

      t.timestamps
    end
  end
end
