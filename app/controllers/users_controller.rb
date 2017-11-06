class UsersController < ApplicationController

  before_action :set_current_user, except: [:new, :create]
  before_action :set_page, only: [:show,:edit,:update]

  def index
    @users= User.all
  end

  def new
    @user = User.new
  end

  def show

  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.assignments.create(role: Role.where(name:"user").first)
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @user.update(user_params)
    @user.assignments.where(user_id:@user.id).destroy_all
      params[:role].each do |role|
      @user.assignments.create(role: Role.where(name:role).first)
      end
    redirect_to users_path
    else
      render 'edit'
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
