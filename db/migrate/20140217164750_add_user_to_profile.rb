class AddUserToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :owner_id, :integer
    add_index :profiles, :owner_id
  end
end
