class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.belongs_to :document
      t.string :name
      t.string :country_code
      t.string :sub_region
      t.string :information_type
      t.integer :reach
    end
    add_foreign_key :sources, :documents, on_delete: :cascade
  end
end
