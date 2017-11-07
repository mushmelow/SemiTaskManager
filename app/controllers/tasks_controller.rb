class TasksController < ApplicationController

  before_action :set_current_user
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @tasks= Task.where(parent_id: nil)

  end

  def show

  end

  def new
    @task = Task.new(parent_id: params[:parent_id])
  end

  def create

    @task = Task.new(task_params)
    @task.author = @current_user
    @task.assign_id= task_params[:assign_id]
    @task.project_id= params[:project_id].to_i
    if params[:parent_id].present?
      @task.parent_id= params.require(:parent_id)
    end
    if @task.save
      redirect_to project_tasks_path(@task.project_id)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    @task.update(task_params)
    redirect_to tasks_path

  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path
  end

  private
  def set_page
    @task= Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :assign_id, :status, :project_id)
  end


end
