class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Rails.application.routes.url_helpers

  # before_action :authenticate_user!

  add_flash_types :info, :error, :success, :warning
  layout :layout_by_resource

  private

  def layout_by_resource
    puts "\n\n\n"
    puts "params['controller']: #{params['controller']}"
    puts "Devise resource: #{resource}"
    puts "Devise resource_name: #{resource_name}"
    puts "\n\n\n"

    case params["controller"]
    when "devise/sessions", "devise/registrations", "devise/passwords"
      "devise"
    else
      "application"
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      projects_path
    else
      issues_path
    end
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  # end
end
