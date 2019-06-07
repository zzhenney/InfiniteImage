class AddForeignKeyToImageStatus < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :status, foreign_key: true
  end
end
