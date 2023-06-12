class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team, optional: true
  has_many :tasks, dependent: :destroy # this is the user's created tasks
  has_many :task_assigned_users, dependent: :destroy
  has_many :assigned_tasks, through: :task_assigned_users, source: :task # this is the user's assigned tasks
end
