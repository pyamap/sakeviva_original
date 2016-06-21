class AddLabelsToThemeTags < ActiveRecord::Migration
  def change
    add_column :theme_tags, :tag_name, :string
  end
end
