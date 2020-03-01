class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.text :image_data
      t.integer :user_id

      t.timestamps
    end

    add_index :photos, :image_data,                unique: true
  end
end
