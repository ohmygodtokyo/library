class RemoveBookIdFromCollections < ActiveRecord::Migration[7.0]
  def change
    remove_reference :collections, :book, null: false, foreign_key: true
  end
end
