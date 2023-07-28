class Project < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :issues, dependent: :destroy

  validates :github_repository_url, presence: true, uniqueness: true
  validates :github_api_key, presence: true

  def enabled_for_github?
    github_repository_url.present? && github_api_key.present?
  end
end
