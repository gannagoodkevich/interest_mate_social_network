class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :status
      t.string :name
      t.string :surname
      t.string :nickname
      t.date :birthday
      t.integer :comment_id
      t.integer :post_id
      t.integer :interest_id
      t.integer :address_id
      t.integer :photo_id
      t.integer :location_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
