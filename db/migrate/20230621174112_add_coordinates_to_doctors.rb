class AddCoordinatesToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :latitude, :float
    add_column :doctors, :longitude, :float
  end
end
