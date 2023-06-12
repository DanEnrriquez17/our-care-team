class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :task_assigned_users
  has_many :assigned_users, through: :task_assigned_users, source: :user #this is the user's assigned tasks
end
