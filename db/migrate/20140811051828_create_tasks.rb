class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.integer :parent_id

      t.timestamps
    end
  end
end
