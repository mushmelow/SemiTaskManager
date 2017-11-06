class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_current_user
    if session[:user_id].present?
      @current_user=User.find(session[:user_id])
    else
      redirect_to new_session_path
    end
  end


end
