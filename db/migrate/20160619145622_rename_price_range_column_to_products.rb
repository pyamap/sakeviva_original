class RenamePriceRangeColumnToProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :price_range, :price_range_id
  end
end
