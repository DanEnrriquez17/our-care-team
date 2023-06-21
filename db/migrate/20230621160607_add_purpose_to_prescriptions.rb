class AddPurposeToPrescriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :prescriptions, :purpose, :string
  end
end
