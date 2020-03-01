class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :status
      t.integer :tag_id
      t.integer :comment_id
      t.integer :user_id
      t.integer :liked_user_id

      t.timestamps
    end

    add_index :posts, :tag_id,                unique: true
  end
end
