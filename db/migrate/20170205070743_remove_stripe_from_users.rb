class RemoveStripeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :publishable_key, :string
    remove_column :users, :secret_key, :string
    remove_column :users, :stripe_user_id, :string
    remove_column :users, :currency, :string
    remove_column :users, :stripe_account_type, :string
  end
end
