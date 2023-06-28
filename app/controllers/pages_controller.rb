class PagesController < ApplicationController
  def home
    @post_feed = Post.all.order(created_at: :desc)
    @events = Event.all
    @tasks = Task.all
    @users = User.all
    @task_notifications = current_user.task_assigned_users.order(created_at: :desc).limit(5)

  end
end
