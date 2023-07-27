class LabelsController < ApplicationController
  before_action :authenticate_user_or_admin!
  before_action :set_label, only: :show

  # GET /labels
  def index
    @labels = Label.all
  end

  # GET /labels/1
  def show
  end

  private

  def set_label
    @label = Label.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def label_params
    params.require(:label).permit(:name)
  end

  def authenticate_user_or_admin!
    if user_signed_in?
      # If a regular user is signed in, allow access
      authenticate_user!
    elsif admin_signed_in?
      # If an admin is signed in, allow access
      authenticate_admin!
    else
      # Redirect to the appropriate path if no user or admin is signed in
      redirect_to new_user_session_path, alert: 'Please sign in.'
    end
  end
end
