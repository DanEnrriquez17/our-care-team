class Prescription < ApplicationRecord
  STATUS = %w(active inactive)
  belongs_to :doctor
  validates :name, presence: true
  validates :dosage, presence: true
  validates :frequency, presence: true
  validates :status, inclusion: { in: STATUS }
end
