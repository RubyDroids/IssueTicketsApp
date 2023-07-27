class AddReferenceLabelToIssue < ActiveRecord::Migration[7.0]
  def change
    add_reference :issues, :label, foreign_key: true, index: true
  end
end
