class RenamePriceRangeIdColumnToProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :price_range_id, :price_id
  end
end
