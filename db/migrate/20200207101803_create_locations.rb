class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.integer :user_id

      t.timestamps
    end
  end
end
