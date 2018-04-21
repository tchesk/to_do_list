class AddPublicListToTaskList < ActiveRecord::Migration[5.2]
  def change
    add_column :task_lists, :public_list, :string
  end
end
