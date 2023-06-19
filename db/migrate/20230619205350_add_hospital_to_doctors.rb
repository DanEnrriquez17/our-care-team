class AddHospitalToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :hospital, :string
  end
end
