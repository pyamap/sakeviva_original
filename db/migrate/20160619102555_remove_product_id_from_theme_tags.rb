class RemoveProductIdFromThemeTags < ActiveRecord::Migration
  def change
    remove_column :theme_tags, :product_id, :integer
  end
end
