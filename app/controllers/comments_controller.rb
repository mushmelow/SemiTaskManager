class CommentsController < ActionController::Base
  before_action :set_comment, only: [:destroy]

  def create
    content= params[:comment][:content]
    taskId=params[:task_id]
    @comment= Comment.create(content:content, task_id: taskId, user_id: session[:user_id])

    if @comment.present?
      redirect_to project_task_path(params[:project_id],@comment.task)
    end

  end

  def destroy
    @comment.destroy()
    redirect_to project_task_path(params[:project_id],params[:task_id])

  end

  private

  def set_comment
    @comment=Comment.find(params[:id].to_i)
  end

end