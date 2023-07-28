class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :label

  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :reported_by, presence: true

  scope :labeled_by, ->(label) { where(label: label) }

  after_create :publish_issue_in_github!

  def label_name
    label.name.downcase
  end

  def rendered_description
    markdown = Redcarpet::Markdown.new(renderer, extensions).render(description)
    markdown.render(description)
  end

  private

  def publish_issue_in_github!
    # Github::PublishIssueJob.perform_later(self)
    Github::PublishIssue.new(self).call
  end
end
