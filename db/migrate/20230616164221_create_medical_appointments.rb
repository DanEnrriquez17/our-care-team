class CreateMedicalAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
