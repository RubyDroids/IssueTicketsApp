class AddVideoLinkToIssue < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :video_link, :string
  end
end
