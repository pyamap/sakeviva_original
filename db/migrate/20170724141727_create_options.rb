class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :product_id
      t.string :title
      t.integer :value

      t.timestamps null: false
    end
  end
end
