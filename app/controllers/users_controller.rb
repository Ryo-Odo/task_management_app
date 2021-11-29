class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :logout_required, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to tasks_path, notice: '他のユーザーページはアクセスは出来ません'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logout_required
    redirect_to tasks_path if logged_in?
  end

end
