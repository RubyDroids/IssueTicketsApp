class IssuesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_project
  before_action :set_issue, only: %i[ show edit update destroy ]

  # GET /issues
  def index
    # resources = @label.present? ? @project.issues.labeled_by(@label) : @project.issues.all
    resources = @project.issues.all

    @pagy, @issues = pagy(resources.order(created_at: :desc))
  end

  # GET /issues/1
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      respond_to do |format|
        format.html { redirect_to issues_path, notice: "Issue was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /issues/1
  def update
    if @issue.update(issue_params)
      redirect_to @issue, notice: "Issue was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /issues/1
  def destroy
    @issue.destroy
    redirect_to issues_path, notice: "Issue was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = @project.issues.find(params[:id])
  end

  def set_project
    @project = current_user.current_project
  end

  # Only allow a list of trusted parameters through.
  def issue_params
    params.require(:issue).permit(:title, :description, :reported_by, :project_id)
    params.require(:issue).permit(:title, :description, :reported_by, :video_link, :project_id, :user_id, :label_id, images: [])
  end
end
