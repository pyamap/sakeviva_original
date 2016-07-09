class AddDetailstoAddresses < ActiveRecord::Migration
  def change
  	add_column :addresses, :user_id, :integer
  	add_column :addresses, :address, :string
  	add_column :addresses, :deafult_address, :boolean, deafult: false, null: false
  end
end
