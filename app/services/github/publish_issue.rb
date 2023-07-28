# frozen_string_literal: true

require "octokit"

# Github::PublishIssue.new(issue).call
module Github
  class PublishIssue < ApplicationService
    attr_reader :issue, :project, :client, :repo

    def initialize(issue)
      @issue  = issue
      @project = issue.project
      @client = Octokit::Client.new(access_token: @project.github_api_key)
      @repo   = @project.github_repository_url
    end

    def call
      title = issue.title
      body  = "*Reportado por #{issue.reported_by}* \n\n"
      body  += issue.description

      if issue.video_link.present?
        video_link_md = "\n
          ### Video con la explicación del problema\n
          #{issue.video_link.to_s}\n\n
        "
        body += video_link_md
      end

      # Attach to the body all images attached to the issue
      if issue.images.attached?
        image_urls = issue.images.map do |image|
          image_urls = markdown_image_url(image)
        end.join("\n\n")

        body += "\n\n" + image_urls
      end

      body  += "\n\n ======================================== \n *Reportado por #{issue.reported_by}*"

      # Publish Issue in Github
      client.create_issue(repo, title, body, labels: [issue.label_name.to_s])

      OpenStruct.new({ success?: true, object: issue })
    rescue StandardError => e
      OpenStruct.new({ success?: false, error: e })
    end

    private

    def markdown_image_url(image)
      image_url = Tools::GetImageLink.call(image)
      "![#{image.filename}](#{image_url})"
    end
  end
end
