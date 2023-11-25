class AddCollectionToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :collections, null: false, foreign_key: true
  end
end
