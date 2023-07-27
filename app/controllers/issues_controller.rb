class IssuesController < ApplicationController
  before_action :authenticate_user_or_admin!

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
    @project= if user_signed_in?
                current_user.current_project
              elsif admin_signed_in?
                current_admin.current_project
              else
                redirect_to root_path, alert: "Missing project assigned to your account"
              end
  end

  # Only allow a list of trusted parameters through.
  def issue_params
    params.require(:issue).permit(:title, :description, :reported_by, :project_id)
    params.require(:issue).permit(:title, :description, :reported_by, :video_link, :project_id, :user_id, :label_id, images: [])
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
