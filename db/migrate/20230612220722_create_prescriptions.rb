class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.string :dosage
      t.string :frequency
      t.string :status
      t.date :end_time
      t.integer :tablets
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
