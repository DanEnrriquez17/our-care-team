class RemoveNameFromDoctors < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :name, :string
  end
end
