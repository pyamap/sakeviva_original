class RenameThemetagIdColumnToProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :themetag_id, :theme_tag_id
  end
end
