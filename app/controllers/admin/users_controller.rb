class Admin::UsersController < ApplicationController
  before_action :authority_login_required
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    p current_user.authority
    @users = User.select(:id, :name, :email, :authority)
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
  end

  def edit
  end


  def update
    if @user.update(admin_user_params)
      redirect_to admin_users_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice:"削除しました"
    else
      redirect_to admin_users_path, notice:"管理ユーザーは最低１名必要です"
    end
  end

  private
  def set_property
    @user = User.find(params[:id])
  end

  def admin_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :authority)
  end

  def authority_login_required
    redirect_to tasks_path, notice:"管理ユーザーでアクセスして下さい" unless current_user.authority
  end
end
