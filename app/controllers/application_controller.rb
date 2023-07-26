class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  add_flash_types :info, :error, :success, :warning
  layout :layout_by_resource

  def after_sign_in_path_for(_resource)
    # Establish different redirect for current_admin and currrent_user
    # if current_admin
    #   admin_root_path
    # else
    #   root_path
    # end
  end

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
