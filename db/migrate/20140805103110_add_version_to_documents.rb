class AddVersionToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :version, :decimal, :default => 1.0
  end
end
