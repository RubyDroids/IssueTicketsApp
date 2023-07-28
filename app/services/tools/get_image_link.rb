# frozen_string_literal: true

require "active_storage/service/s3_service"

# Tools::GetImageLink.call(image)
module Tools
  class GetImageLink < ApplicationService
    include Rails.application.routes.url_helpers

    attr_reader :image, :service

    def initialize(image)
      @image = image
      @service = ActiveStorage::Service::S3Service.new(
        access_key_id: ENV.fetch("S3_ACCESS_KEY"),
        secret_access_key: ENV.fetch("S3_SECRET_KEY"),
        endpoint: ENV.fetch("S3_BUCKET_ENDPOINT"),
        region: ENV.fetch("S3_BUCKET_REGION"),
        bucket: ENV.fetch("S3_BUCKET_NAME"),
      )
    end

    def call
      preview_url = service.url(
        image.blob.key,
        expires_in: 1.day,
        filename: image.filename,
        disposition: "inline",
        content_type: image.content_type,
      )

      preview_url.split("?").try(:first)
    end
  end
end
