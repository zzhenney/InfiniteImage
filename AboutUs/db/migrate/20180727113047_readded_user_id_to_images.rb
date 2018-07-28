=begin
Author: Joe Phabmixay 
Purpose: Devise requires a user_id, so we will replace image_owner_id for ownership
Variables:
    none
Date: 7/28/18
=end

class ReaddedUserIdToImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :image_owner_id
    add_column :images, :user_id, :integer, :after => :id
  end
end
