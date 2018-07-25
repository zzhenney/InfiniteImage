=begin
Author: Joe Phabmixay 
Purpose: Encrypted password columns sometimes does not get added to the schema. This migration files manually adds it to the schema.
Variables:
    none
Date: 7/25/18
=end

class AddedEncryptedPassToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_password, :string, null: false, limit: 128, :after => :last_name
    add_column :users, :confirmation_token, :string, null: false, limit: 128, :after => :encrypted_password
    add_column :users, :remember_token, :string, null: false, limit: 128 , :after => :confirmation_token
  end
end
