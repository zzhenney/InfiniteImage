class RenameTagToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :tag_id, :category_id
  end
end
