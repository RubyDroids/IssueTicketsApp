class LabelsController < ApplicationController
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
end
