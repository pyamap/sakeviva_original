class AddSubtitlesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :story_title_one, :string
    add_column :products, :story_title_two, :string
  end
end
