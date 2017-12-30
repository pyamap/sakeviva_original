class ChangeDatatypeTelOfAddresses < ActiveRecord::Migration
  def change
    change_column :addresses, :tel, :string
  end
end
