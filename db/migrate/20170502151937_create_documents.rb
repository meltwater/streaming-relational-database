class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :sentiment
      t.datetime :publish_date
      t.string :language_code
      t.string :image_link
      t.string :city
      t.string :region
      t.string :author
      t.string :hit_sentence
      t.string :meltwater_uuid
      t.string :url

      t.timestamps
    end
  end
end
