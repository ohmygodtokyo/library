class RemoveCollectionsIdFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :collections_id, :bigint
  end
end
