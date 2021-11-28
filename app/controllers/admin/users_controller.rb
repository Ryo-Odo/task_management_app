class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :index]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(admin_user_params)
    if @user.save
      redirect_to admin_user_path(@user.id), notice: "ユーザー登録しました"
    else
      render :new, notice: "ユーザー登録に失敗しました"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
  end

  def destroy
  end

  private
  def admin_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
