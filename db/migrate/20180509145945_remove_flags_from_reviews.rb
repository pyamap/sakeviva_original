class RemoveFlagsFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :order_id, :integer
    remove_column :reviews, :review_flag, :boolean
  end
end
