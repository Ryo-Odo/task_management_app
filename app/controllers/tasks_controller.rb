class TasksController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    if params[:search].present?
      @tasks = Task.search_task_name_status(params[:search][:task_name],params[:search][:status]) if params[:search][:task_name].present? && params[:search][:status].present?
      @tasks = Task.search_task_name(params[:search][:task_name]) if params[:search][:task_name].present? && params[:search][:status].blank?
      @tasks = Task.search_status(params[:search][:status]) if params[:search][:task_name].blank? && params[:search][:status].present?
    end

    if params[:sort_deadline]
      @tasks = @tasks.order(deadline: "DESC")
    else
      @tasks = @tasks.order(created_at: "DESC")
    end

    if params[:sort_priority]
      @tasks = @tasks.order(priority: "DESC")
    else
      @tasks = @tasks.order(created_at: "DESC")
    end
    @tasks = @tasks.page(params[:page]).per(5)

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
    params.require(:task).permit(:task_name, :content, :deadline, :status, :priority)
  end
end
