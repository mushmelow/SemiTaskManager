class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :description
      t.boolean :status
      t.integer :user_id
      t.integer :parent_id

      t.timestamps
    end




  end
end
