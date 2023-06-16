class MedicalAppointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :event
end
