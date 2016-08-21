class AddDefaultVariableToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :delivery, :integer, :default => 1
  end
end
