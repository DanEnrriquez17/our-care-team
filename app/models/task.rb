class Task < ApplicationRecord
  belongs_to :user
  has_many :task_assigned_users
  has_many :assigned_users, through: :task_assigned_users, source: :user #this is the user's assigned tasks
  has_one_attached :photo

  def owner
    self.user
  end
end
