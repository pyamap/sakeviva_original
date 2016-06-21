class AddThemeTagToProducts < ActiveRecord::Migration
  def change
    add_column :products, :themetag_id, :integer
  end
end
