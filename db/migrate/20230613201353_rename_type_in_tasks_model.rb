class RenameTypeInTasksModel < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :type, :task_type
  end
end
