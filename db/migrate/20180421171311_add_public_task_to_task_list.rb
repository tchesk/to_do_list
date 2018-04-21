class AddPublicTaskToTaskList < ActiveRecord::Migration[5.2]
  def change
    add_column :task_lists, :public_task, :string
  end
end
