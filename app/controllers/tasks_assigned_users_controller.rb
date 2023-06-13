class TasksAssignedUsersController < ApplicationController
  before_action :set_task_assigned_user, only: [:show, :edit, :update, :destroy]

  def index
    @task_assigned_users = TaskAssignedUser.all
  end

  def new
    @task_assigned_user = TaskAssignedUser.new
  end

  def create
    @task_assigned_user = TaskAssignedUser.new(task_assigned_user_params)
    if @task_assigned_user.save
      redirect_to @task_assigned_user
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @task_assigned_user.update(task_assigned_user_params)
      redirect_to task_assigned_user_path(@task_assigned_user)
    else
      redirect_to edit_task_assigned_user_path(@task_assigned_user), status: :unprocessable_entity
    end
  end

  def destroy
    @task_assigned_user.destroy
    redirect_to task_assigned_users_path
  end

  private

  def task_assigned_user_params
    params.require(:task_assigned_user).permit(:id_users, :id_tasks)
  end

  def set_task_assigned_user
    @task_assigned_user = TaskAssignedUser.find(params[:id])
  end
end
