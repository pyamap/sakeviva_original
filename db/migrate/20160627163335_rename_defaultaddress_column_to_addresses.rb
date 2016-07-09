class RenameDefaultaddressColumnToAddresses < ActiveRecord::Migration
  def change
  	rename_column :addresses, :deafult_address, :default_address
  end
end
