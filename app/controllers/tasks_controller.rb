class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    @task.user = current_user
    if @task.save
      redirect_to tasks_path(@task)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @task.update(params_task)
      redirect_to tasks_path(@task)
    else
      redirect_to edit_task_path(@task), status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def params_task
    params.require(:task).permit(:title, :description, :status, :due_date, :task_type, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
