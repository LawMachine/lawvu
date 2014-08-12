class CreateMatterTasks < ActiveRecord::Migration
  def change
    create_table :matter_tasks do |t|
      t.integer :matter_id
      t.integer :task_id
      t.integer :assigned_to_user_id
      t.date :due_date
      t.decimal :task_fee_estimate, :precision => 12, :scale => 2

      t.timestamps
    end
  end
end
