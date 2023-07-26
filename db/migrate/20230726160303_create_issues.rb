class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.string :reported_by
      t.references :project, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
