class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.references :client
      t.references :lawyer
      t.references :user
      t.integer :case_type
      t.text :issue
      t.text :help_asked_by_client
      t.text :help_given_by_lawyer
      t.integer :fee_arrangement_by_client
      t.integer :fee_arrangement_by_lawyer
      t.string :fee_arrangement_suggestion
      t.decimal :fixed_fee_amount
      t.decimal :budget
      t.string :client_reference
      t.string :lawyer_reference
      t.string :timeframe
      t.date :expected_completion_date
      t.integer :bill_frequency
      t.integer :status
      t.boolean :archived, :default=>false
      t.timestamps
    end
  end
end
