class ChangeIntegerLimitInUser < ActiveRecord::Migration
  def change
    change_column :users, :mobile, :integer, limit: 8
  end
end
