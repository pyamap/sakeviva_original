class RenamePriceColumnToProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :price, :value
  end
end
