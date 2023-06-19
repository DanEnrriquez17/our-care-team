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
    @tasks = @tasks.order(:due_date)
    @task = Task.new

    respond_to do |format|
      format.html
      format.text { render partial: 'tasks/tasks', locals: { tasks: @tasks }, formats: [:html] }
    end
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
