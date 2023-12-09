class RemoveBookIdFromCollections < ActiveRecord::Migration[7.0]
  def change
    remove_reference :collections, :book, null: true, foreign_key: false
  end
end
