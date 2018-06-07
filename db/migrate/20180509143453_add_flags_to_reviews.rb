class AddFlagsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :order_id, :integer
    add_column :reviews, :review_flag, :boolean, default: false, null: false
  end
end
