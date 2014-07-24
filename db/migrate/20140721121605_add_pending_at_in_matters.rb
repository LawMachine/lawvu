class AddPendingAtInMatters < ActiveRecord::Migration
  def change
    add_column :matters, :pending_at, :string
  end
end
