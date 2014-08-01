class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :matter_id
      t.string :doc
      t.integer :user_id

      t.timestamps
    end
  end
end
