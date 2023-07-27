# frozen_string_literal: true

# app/services/application_service.rb

require "uri"
require "net/http"
require "openssl"

class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
