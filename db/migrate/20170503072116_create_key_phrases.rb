class CreateKeyPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :key_phrases do |t|
      t.belongs_to :document
      t.float :relevance
      t.string :phrase

      t.timestamps
    end
    add_foreign_key :key_phrases, :documents, on_delete: :cascade
  end
end
