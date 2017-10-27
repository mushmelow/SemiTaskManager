class TasksController < ApplicationController

  before_action :set_current_user
  before_action :set_page, only: [:show]

  def index
    @tasks= Task.all

  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(user_params)
    @task.author = @current_user

    if @task.save
      redirect_to task_path(@task)
    else
      exit
      render 'new'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private
  def set_page
    @task= Task.find(params[:id])
  end

  def user_params
    params.require(:task).permit(:name, :description)
  end


end
