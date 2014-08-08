class AddParentDocIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :parent_doc_id, :integer
  end
end
