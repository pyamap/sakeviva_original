class RenameDeliveryColumnToOrders < ActiveRecord::Migration
  def change
  	rename_column :orders, :delivery, :delivery_id
  end
end
