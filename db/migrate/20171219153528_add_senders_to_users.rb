class AddSendersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :integer
    add_column :users, :sender, :string
  end
end
