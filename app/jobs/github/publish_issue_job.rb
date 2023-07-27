# frozen_string_literal: true

module Github
  class PublishIssueJob < ApplicationJob
    queue_as :default

    def perform(issue)
      return unless issue.project.enabled_for_github?

      Github::PublishIssue.new(issue).call
    end
  end
end
