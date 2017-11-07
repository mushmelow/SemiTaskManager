class ProjectsController < ApplicationController
  before_action :set_current_user

  def index
   @projects= Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
    set_project
  end


  private

  def set_project
    @project= Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end


