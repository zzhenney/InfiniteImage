class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id
      t.boolean :is_admin
      t.integer :cart_id
      t.integer :album_list
      t.integer :friend_list
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
