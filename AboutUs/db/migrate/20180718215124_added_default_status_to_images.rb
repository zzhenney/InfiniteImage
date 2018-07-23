class AddedDefaultStatusToImages < ActiveRecord::Migration[5.2]
  def change
    change_column_default :images, :status_id, 0
  end
end
