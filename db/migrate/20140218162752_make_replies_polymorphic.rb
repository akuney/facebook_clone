class MakeRepliesPolymorphic < ActiveRecord::Migration
  def change
    change_table :replies do |t|
      t.references :parent, :polymorphic => true
    end
    remove_column :replies, :comment_id
  end
end
