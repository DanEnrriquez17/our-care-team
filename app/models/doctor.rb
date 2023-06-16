class Doctor < ApplicationRecord
  belongs_to :user
  has_many :prescriptions
  def full_name
    "#{first_name} #{last_name}"
  end
end
