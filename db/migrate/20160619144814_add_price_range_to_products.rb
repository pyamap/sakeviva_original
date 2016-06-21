class AddPriceRangeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price_range, :integer
  end
end
