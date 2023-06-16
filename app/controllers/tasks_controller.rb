class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @tasks = Task.order(created_at: :desc)
  end

  def new
    @task = Task.new
    @users = User.all # This will fetch all users
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save!
      redirect_to tasks_path(@task)
    else
      render :new

    end
  end

  def edit
  end

  def show
  end

  def complete
    @task.update(status: 'Completed')
    redirect_to tasks_path
  end

  def update
    if @task.update!(task_params)
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

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, :task_type, :user_id, assigned_user_ids: [])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
