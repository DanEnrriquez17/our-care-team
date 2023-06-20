class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team, optional: true
  has_many :tasks, dependent: :destroy # this is the user's created tasks
  has_many :task_assigned_users, dependent: :destroy
  has_many :assigned_tasks, through: :task_assigned_users, source: :task # this is the user's assigned tasks
  has_many :events, dependent: :destroy # this is the user's created events
  has_many :event_invited_users, dependent: :destroy
  has_many :invited_events, through: :event_invited_users, source: :event # this is the user's invited events
  has_many :posts, dependent: :destroy # this is the user's created posts
  has_many :post_mentioned_users, dependent: :destroy
  has_many :mentioned_posts, through: :post_mentioned_users, source: :post # this is the user's mentioned posts
  has_many :notifications, dependent: :destroy # this is the user's notifications
end
