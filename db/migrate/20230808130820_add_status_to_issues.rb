class AddStatusToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :completed, :boolean, default: false
  end
end
