class CreateTranslators < ActiveRecord::Migration[7.0]
  def change
    create_table :translators do |t|
      t.text :translated_text
      t.string :original_language
      t.string :translated_language
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
