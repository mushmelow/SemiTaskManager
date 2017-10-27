class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :status
      t.integer :author_id
      t.integer :parent_id

      t.timestamps
    end




  end
end
