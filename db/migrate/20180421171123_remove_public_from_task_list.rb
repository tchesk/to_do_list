class RemovePublicFromTaskList < ActiveRecord::Migration[5.2]
  def change
    remove_column :task_lists, :public, :string
  end
end
