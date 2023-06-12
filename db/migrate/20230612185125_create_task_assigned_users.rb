class CreateTaskAssignedUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :task_assigned_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
