class TasksController < ApplicationController

  before_action :set_current_user
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @tasks= Task.where(parent_id: nil,project_id:params[:project_id])

  end

  def show

    if @task.parent_id.nil?
      subtasks_hour=@task.sub_tasks.map {|subtask| subtask.hours}
      total_sub=subtasks_hour.flatten.map{|hour| hour.time_add}.sum
      total_present=@task.hours.map {|time|time.time_add}.sum
      @total=total_sub+total_present

    else
      total=@task.hours.map {|time|time.time_add}
      @total= total.sum
    end

  end


  def new
    @task = Task.new(parent_id: params[:parent_id])
    @project= Project.find(params[:project_id])

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
    @project= Project.find(params[:project_id])

  end

  def update
    @task.update(task_params)
    redirect_to project_tasks_path
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
