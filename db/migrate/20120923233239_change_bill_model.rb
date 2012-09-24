class ChangeBillModel < ActiveRecord::Migration
  def up
    rename_column :bills, :name, :title
    add_column :bills, :user_id, :integer
  end

  def down
    rename_column :bills, :title, :name
    remove_column :bills, :user_id
  end
end
