class AddColumnsToThemeTags < ActiveRecord::Migration
  def change
    add_column :theme_tags, :title, :string
    add_column :theme_tags, :overview, :string
    add_column :theme_tags, :thumbnail, :binary
  end
end
