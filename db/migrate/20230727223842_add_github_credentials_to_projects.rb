class AddGithubCredentialsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :github_repository_url, :string
    add_column :projects, :github_api_key, :string
  end
end
