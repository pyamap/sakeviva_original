class AddSenderAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sender_address, :string
  end
end
