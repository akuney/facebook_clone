class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.integer :uploader_id
      t.timestamps
    end

    add_index :photos, :uploader_id
  end
end
