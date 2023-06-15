class AddNameToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :prescriptions, :name, :string
  end
end
