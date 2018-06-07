class AddReviewsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :review_id, :integer
    add_column :orders, :review_flag, :boolean, default: false, null: false
  end
end
