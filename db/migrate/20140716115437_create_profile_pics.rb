class CreateProfilePics < ActiveRecord::Migration
  def change
    create_table :profile_pics do |t|
      t.string :name
      t.references :user
      t.timestamps
    end
  end
end
