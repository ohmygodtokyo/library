class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :heading
      t.text :body
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
