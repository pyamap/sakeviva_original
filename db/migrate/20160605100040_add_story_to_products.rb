class AddStoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :overview_one, :string
    add_column :products, :overview_two, :string
  end
end
