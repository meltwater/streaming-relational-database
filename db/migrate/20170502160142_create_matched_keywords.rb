class CreateMatchedKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :matched_keywords do |t|
      t.belongs_to :document
      t.string :value

      t.timestamps
    end
    add_foreign_key :matched_keywords, :documents, on_delete: :cascade
  end
end
