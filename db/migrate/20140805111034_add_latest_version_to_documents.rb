class AddLatestVersionToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :latest_version, :boolean, :default => true
  end
end
