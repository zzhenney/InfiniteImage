class AddUserIdToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :user_id, :string
  end
end
