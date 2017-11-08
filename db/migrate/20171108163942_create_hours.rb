class CreateHours < ActiveRecord::Migration[5.0]
  def change
    create_table :hours do |t|
      t.string :description
      t.integer :time_add, :default => 0
      t.integer :task_id

      t.timestamps
    end
  end
end
