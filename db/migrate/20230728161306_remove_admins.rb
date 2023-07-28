class RemoveAdmins < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :projects, :admins
    remove_column :projects, :admin_id
    drop_table :admins
  end
end
