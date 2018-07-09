class RenameTagToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :category_id, :category_id
  end
end
