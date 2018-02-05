class AddTermsConfirmedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :terms_confirmed, :boolean
  end
end
