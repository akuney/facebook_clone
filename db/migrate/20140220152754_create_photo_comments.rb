class CreatePhotoComments < ActiveRecord::Migration
  def change
    create_table :photo_comments do |t|
      t.integer :photo_id
      t.text :text
      t.timestamps
    end
  end
end
