class Event < ApplicationRecord
  EVENTTYPES = ["Doctor Appointment", "Physical Therapy", "Guest in Town", "Other"]
  belongs_to :user
  has_many :event_invited_users
  has_many :invited_users, through: :event_invited_users, source: :user # this is the user's invited events
  validates :event_type, inclusion: { in: EVENTTYPES }

  def owner
    self.user
  end
end
