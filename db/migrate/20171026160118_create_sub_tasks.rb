class CreateSubTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_tasks do |t|
      t.string :sub_task_name
      t.string :description
      t.boolean :status
      t.integer :task_id

      t.timestamps
    end


  end
end
