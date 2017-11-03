class TasksController < ApplicationController

  before_action :set_current_user
  before_action :set_page, only: [:show, :edit]

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
    if params[:parent_id].present?
    @task.parent_id= params.require(:parent_id)
    end
    if @task.save
      redirect_to task_path(@task)
    else

      render 'new'
    end
  end

  def edit

  end

  def update

    set_page.update(task_params)
    redirect_to tasks_path

  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private
  def set_page
    @task= Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :assign_id, :status)
  end


end
