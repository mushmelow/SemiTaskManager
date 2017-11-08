class SessionsController < ApplicationController
  before_action :set_current_user, only: [:destroy]

  def create
    user= User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to projects_path

    else
      flash[:notice] = "Wrong credential!!!"
      render 'new'

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end