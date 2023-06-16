class Doctor < ApplicationRecord
  belongs_to :user
  has_many :prescriptions
  has_many :medical_appointments
  has_many :events, through: :medical_appointments
  def full_name
    "#{first_name} #{last_name}"
  end
end
