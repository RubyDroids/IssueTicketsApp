class Project < ApplicationRecord
  belongs_to :admin

  has_many :users, dependent: :nullify
  has_many :issues, dependent: :destroy

  def enabled_for_github?
    github_repo_url.present? && github_api_key.present?
  end
end
