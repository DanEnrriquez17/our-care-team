class AddFirstNameToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
  end
end
