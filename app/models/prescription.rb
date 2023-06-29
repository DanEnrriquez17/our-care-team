require 'csv'

class Prescription < ApplicationRecord
  STATUS = %w(active inactive)
  belongs_to :doctor
  validates :name, presence: true
  validates :dosage, presence: true
  validates :frequency, presence: true
  validates :status, inclusion: { in: STATUS }

  def self.to_csv
    attributes = %w{name status dosage frequency purpose}
    CSV.generate(headers: true) do |csv|
      CSV.generate(headers: true) { |csv| csv << (attributes + ["doctor"]) }

      all.each do |prescription|
        doctor_full_name = "#{prescription.doctor.first_name} #{prescription.doctor.last_name}"
        csv << attributes.map{ |attr| prescription.send(attr) } + [doctor_full_name]
      end
    end
  end
end
