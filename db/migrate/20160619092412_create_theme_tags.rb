class CreateThemeTags < ActiveRecord::Migration
  def change
    create_table :theme_tags do |t|
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
