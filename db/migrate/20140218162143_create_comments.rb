class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :recipient_id
      t.text :text

      t.timestamps
    end
  end
end
