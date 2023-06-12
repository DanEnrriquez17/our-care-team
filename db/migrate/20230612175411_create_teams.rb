class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :patient_first
      t.string :patient_last

      t.timestamps
    end
  end
end
