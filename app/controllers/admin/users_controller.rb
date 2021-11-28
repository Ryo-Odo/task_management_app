class Admin::UsersController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  def index
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
    @user.destroy
    redirect_to admin_users_path, notice:"削除しました"
  end

  private
  def set_property
    @user = User.find(params[:id])
  end

  def admin_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :authority)
  end
end
