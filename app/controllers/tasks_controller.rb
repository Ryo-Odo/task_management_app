class TasksController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_expired]
      @tasks = Task.all.order(deadline: "DESC")
    else
      @tasks = Task.all.order(created_at: "DESC")
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to task_path(@task.id), notice: "登録しました！"
    else
      render :new, notice: "登録に失敗しました"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      redirect_to tasks_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"削除しました"
  end

  private
  def set_property
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:task_name, :content, :deadline)
  end
end
