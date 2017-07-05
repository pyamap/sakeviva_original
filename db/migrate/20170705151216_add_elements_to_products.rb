class AddElementsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :alcoholpercentage, :string
    add_column :products, :ingredients, :string
    add_column :products, :sakepercentage, :string
    add_column :products, :ricedegree, :string
  end
end
