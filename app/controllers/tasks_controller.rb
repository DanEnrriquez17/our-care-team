class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]
  layout false, only: :new, format: :js


  def index
    if params[:filter]
      if params[:filter] == 'user'
        @tasks = current_user.assigned_tasks
      else
        @tasks = Task.where(status: params[:filter])
      end
    else
      @tasks = Task.all
    end
    @tasks = @tasks.order(created_at: :desc)
    @task = Task.new
    @task_notifications = current_user.task_assigned_users.order(created_at: :desc).limit(5)

    respond_to do |format|
      format.html
      format.text { render partial: 'tasks/tasks', locals: { tasks: @tasks }, formats: [:html] }
    end
    @users = User.all
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

  def show
  end

  def complete
    @task.update(status: 'Completed')
    redirect_to tasks_path
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, :task_type, :user_id, :photo, assigned_user_ids: [])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
