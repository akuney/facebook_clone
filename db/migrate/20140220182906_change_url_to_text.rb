class ChangeUrlToText < ActiveRecord::Migration
  def change
    remove_column :photos, :url
    add_column :photos, :url, :text

    remove_column :profiles, :photo_url
    add_column :profiles, :photo_url, :text
  end
end
