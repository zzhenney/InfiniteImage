class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :image_id
      t.boolean :is_approved
      t.string :image_title
      t.integer :image_owner_id
      t.belongs_to :tag     #Foreign Key
      t.string :licensing
      t.date :date
      t.text :description
      t.string :file_type
      t.string :location

      t.timestamps
    end
  end
end
