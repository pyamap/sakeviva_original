class RemoveTermsConfirmedFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :terms_confirmed, :boolean
  end
end
