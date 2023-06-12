class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :event_invited_users
  has_many :invited_users, through: :event_invited_users, source: :user # this is the user's invited events
end
