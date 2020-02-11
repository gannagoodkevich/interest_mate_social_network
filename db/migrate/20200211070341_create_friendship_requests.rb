class CreateFriendshipRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friendship_requests do |t|
      t.integer :requestor_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
