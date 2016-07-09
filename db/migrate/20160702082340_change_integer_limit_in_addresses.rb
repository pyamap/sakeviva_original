class ChangeIntegerLimitInAddresses < ActiveRecord::Migration
  def change
  	change_column :addresses, :tel, :integer, limit:8
  end
end
