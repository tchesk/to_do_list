class CreatePublicTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :public_tasks do |t|
      t.string :task_description

      t.timestamps
    end
  end
end
