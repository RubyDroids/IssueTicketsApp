# frozen_string_literal: true

require "sidekiq"
require "sidekiq/web"

# https://rubygarage.github.io/slides/sidekiq#/8/7

# if Rails.env.production? || Rails.env.staging?
Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
end
# end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://127.0.0.1:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://127.0.0.1:6379/0' }
end

# Sidekiq.configure_server do |config|
#   config.redis = { url: ENV.fetch("REDIS_URL"), ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
#   schedule_file = "config/schedule.yml"
#   Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file)
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: ENV.fetch("REDIS_URL"), ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
# end
