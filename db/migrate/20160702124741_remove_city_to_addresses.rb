class RemoveCityToAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :city, :string
  end
end
