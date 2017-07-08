class RemoveStoryFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :overview_one, :string
    remove_column :products, :overview_two, :string
    remove_column :products, :story_title_one, :string
    remove_column :products, :story_title_two, :string
  end
end
