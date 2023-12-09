class AddCollectionToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :collections, null: true, foreign_key: true
  end
end
