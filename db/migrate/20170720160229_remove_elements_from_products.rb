class RemoveElementsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :alcoholpercentage, :string
    remove_column :products, :ingredients, :string
    remove_column :products, :sakepercentage, :string
    remove_column :products, :ricedegree, :string
  end
end
