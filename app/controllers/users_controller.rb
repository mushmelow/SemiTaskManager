class UsersController < ApplicationController

  before_action :set_current_user, except: [:new, :create]


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
  end

  def edit
    set_page

  end

  def update

    set_page.update(update_params)

    if role_params.present?
      @user.assignments.where(user_id:@user.id).destroy_all

      if role_params.include?(1.to_s)
        @user.assignments.create(role_id:1)
      end
      if role_params.include?(2.to_s)
        @user.assignments.create(role_id:2)
      end
    end

    redirect_to users_path
  end

  private

  def set_page
    @user= User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_params
    params.require(:user).permit(:name, :email)
  end
  def role_params
    params[:role]
  end
end
