class RemoveUnusedColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :stripe_id, :string
    remove_column :users, :stripe_subscription_id, :string
    remove_column :users, :card_last4, :string
    remove_column :users, :card_exp_month, :integer
    remove_column :users, :card_exp_year, :integer
    remove_column :users, :card_type, :string
    remove_column :users, :admin, :boolean
    remove_column :users, :subscribed, :boolean
  end
end
