class TasksController < ApplicationController

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
    @task.user_id= User.find(session[:user_id]).id

    if @task.save
      redirect_to task_path(@task)
    else
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
    params.require(:task).permit(:task_name, :description)
  end


end
