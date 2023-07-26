class AddUserProjectReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :project, foreign_key: true, index: true
  end
end
