class UsersController < ApplicationController

  before_action :set_current_user, except: [:new, :create]
  before_action :is_admin?, only: [:edit, :destroy]

  def index
    @users= User.all
  end

  def new
    @user = User.new
  end

  def show
    set_page
  end

  def create
    @user = User.new(user_params)
    if @user.save

      redirect_to new_session_path
    else

      render 'new'
    end

    def edit
      set_page
      exit
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
