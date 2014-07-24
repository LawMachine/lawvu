class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :mobile_no
      t.timestamps
    end
  end
end
