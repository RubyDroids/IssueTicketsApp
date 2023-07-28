require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IssueTicketsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.exceptions_app = routes
    config.encoding = "utf-8"
    config.i18n.default_locale = "es"
    config.i18n.locale = "es"
    config.i18n.available_locales = ["es", "en"]
    config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.{rb,yml}").to_s]
    config.i18n.fallbacks = false
    config.time_zone = "Buenos Aires"

    config.active_job.queue_adapter = :sidekiq

    # config.after_initialize do |app|
    #   app.routes.default_url_options = app.config.action_mailer.default_url_options
    # end
  end
end
