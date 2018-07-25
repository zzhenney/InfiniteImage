# Removed Columns: image_id:int , is_approved:boolean.

class ChangeImagesStatusAttribute < ActiveRecord::Migration[5.2]
    def up
      remove_column :images, :is_approved
      remove_column :images, :image_id
    end

    def down
      add_column :images, :is_approved, :boolean
      add_column :images, :image_id, :integer
    end
end
