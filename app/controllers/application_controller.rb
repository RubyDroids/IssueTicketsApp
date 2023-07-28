class ApplicationController < ActionController::Base
  include Pagy::Backend

  add_flash_types :info, :error, :success, :warning
  layout :layout_by_resource

  private

  def layout_by_resource
    case params["controller"]
    when "devise/sessions", "devise/registrations", "devise/passwords"
      "devise"
    else
      "application"
    end
  end
end
