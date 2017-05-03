class AddMetadataToDocument < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :search_name, :string
    add_column :documents, :search_id, :integer
    add_column :documents, :hook_id, :string
  end
end
