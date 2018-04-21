class RemovePublicTaskFromTaskList < ActiveRecord::Migration[5.2]
  def change
    remove_column :task_lists, :public_task, :string
  end
end
