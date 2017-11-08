class HoursController < ApplicationController
  def create
    taskId=params[:task_id]
    projectId=params[:project_id]
    @hour= Hour.new(hour_params)
    @hour.task_id= taskId

    if @hour.save
      redirect_to project_tasks_path(projectId,taskId)
    end
  end

  private

  def hour_params
    params.require(:hour).permit(:description,:time_add )
  end
end
