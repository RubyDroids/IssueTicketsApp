class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :label

  has_many_attached :images

  validates :title, presence: true
  # validates :description, presence: true, length: { minimum: 10 }
  validates :reported_by, presence: true

  scope :labeled_by, ->(label) { label.present? ? where(label:) : all }
  scope :pending, -> { where(completed: false) }
  scope :resolved, -> { where(completed: true) }
  scope :resolved_if, ->(resolved_param) { resolved_param ? resolved : pending }

  after_create :publish_issue_in_github!

  def label_name
    label.name.downcase
  end

  def rendered_description
    markdown = Redcarpet::Markdown.new(renderer, extensions).render(description)
    markdown.render(description)
  end

  def toggle_status!
    update(completed: !completed)
  end

  def current_status
    completed
  end

  private

  def publish_issue_in_github!
    Github::PublishIssueJob.perform_later(self)
    # Github::PublishIssue.new(self).call
  end
end
