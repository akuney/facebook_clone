class CreatePhotoTaggings < ActiveRecord::Migration
  def change
    create_table :photo_taggings do |t|
      t.integer :photo_id
      t.integer :user_id
      t.timestamps
    end
  end
end
