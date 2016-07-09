class AddMoreInfoToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :tel, :integer
    add_column :addresses, :recipient, :string
    add_column :addresses, :postalcode, :integer
    add_column :addresses, :city, :string
  end
end
