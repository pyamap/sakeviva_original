class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.integer :shop_id
      t.integer :prefecture_id
      t.integer :fee

      t.timestamps null: false
    end
  end
end
