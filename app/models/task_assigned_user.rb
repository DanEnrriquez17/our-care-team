class TaskAssignedUser < ApplicationRecord
  belongs_to :user
  belongs_to :task

  def time_ago
    ((DateTime.now - self.created_at.to_datetime) * 24 * 60).to_i
  end
end
