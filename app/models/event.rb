class Event < ApplicationRecord
  belongs_to :user
  has_many :event_invited_users
  has_many :invited_users, through: :event_invited_users, source: :user # this is the user's invited events

  def owner
    self.user
  end
end
