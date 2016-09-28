class ProjectsController < ApplicationController
  before_action :find_projects, only: [:index, :edit]
  before_action :find_project, only: [:edit, :update]

  def index
    @project  = Project.new
  end

  def edit
    render :index
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      find_projects
      render :index
    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      find_projects
      render :index
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, emails: [])
  end

  def find_projects
    @projects = Project.order(updated_at: :desc).load
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
