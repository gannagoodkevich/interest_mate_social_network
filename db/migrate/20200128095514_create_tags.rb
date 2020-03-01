class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :post_id

      t.timestamps
    end

    add_index :tags, :name,                unique: true
  end
end
