class CommentsController < ActionController::Base
  before_action :set_current_user, except: [:create]

  def create
    content= params[:comment][:content]
    taskId=params[:task_id]
    @comment= Comment.create(content:content, task_id: taskId, user_id: session[:user_id])

    if @comment.present?
      redirect_to task_path(@comment.task)
    end
  end

end