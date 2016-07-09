class AddPrefectureIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :prefecture_id, :integer
  end
end
