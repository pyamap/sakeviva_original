class RemoveDeliveryToOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :delivery, :string
  end
end
