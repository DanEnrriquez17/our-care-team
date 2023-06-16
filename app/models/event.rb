class Event < ApplicationRecord
  EVENTTYPES = ["Doctor Appointment", "Physical Therapy", "Guest in Town", "Other"]
  belongs_to :user
  has_many :event_invited_users
  has_many :invited_users, through: :event_invited_users, source: :user # this is the user's invited events
  validates :event_type, inclusion: { in: EVENTTYPES }
  validates :start, :end, presence: true

  def owner
    self.user
  end

  def start_time
    self.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end

  def end_time
    self.end ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
