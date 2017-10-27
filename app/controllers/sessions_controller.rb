class SessionsController < ApplicationController


  def show

  end

  def new

  end


  def create
    user= User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)

    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_path
  end
end