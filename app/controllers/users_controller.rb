class UsersController < ApplicationController

  before_action :set_current_user, except: [:new, :create]
  before_action :set_page, only: [:show]



  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      redirect_to new_session_path
    else

      render 'new'
    end
  end

  private

  def set_page
    @user= User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
