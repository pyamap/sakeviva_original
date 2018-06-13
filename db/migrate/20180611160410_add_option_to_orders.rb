class AddOptionToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :option, :integer
  end
end
