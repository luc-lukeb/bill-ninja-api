class ItemsModelChange < ActiveRecord::Migration
  def up
    rename_column :items, :name, :title
    add_column :items, :user_id, :integer
  end

  def down
    rename_column :items, :title, :name
    remove_column :items, :user_id
  end
end
