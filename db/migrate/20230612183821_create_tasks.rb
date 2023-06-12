class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :status
      t.string :title
      t.datetime :due_date
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
