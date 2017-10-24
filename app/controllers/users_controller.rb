class UsersController < ApplicationController
  before_action :set_page, only: [:show,:edit,:update,:destroy]

  def index

  end


  def show
    set_page
  end


  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/users/new'
    end
  end

  private

  def set_page
    @user= User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
