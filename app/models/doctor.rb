class Doctor < ApplicationRecord
  belongs_to :user
  has_many :prescriptions, dependent: :destroy
  has_many :medical_appointments, dependent: :destroy
  has_many :events, through: :medical_appointments
  has_one_attached :avatar
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  def full_name
    "#{first_name} #{last_name}"
  end
end
