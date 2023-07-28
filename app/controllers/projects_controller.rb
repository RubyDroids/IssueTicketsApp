class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :restrict_access

  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project was successfully destroyed.", status: :see_other
  end

  private

  def restrict_access
    redirect_to root_path, alert: "You don't have access to this page" unless current_user.admin?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :website_url, :github_repository_url, :github_api_key)
  end
end
