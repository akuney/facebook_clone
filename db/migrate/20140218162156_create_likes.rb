class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :liker_id
      t.references :post, polymorphic: true
      t.timestamps
    end
  end
end
