class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :website_url
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
