class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend_user, null: false, foreign_key: { to_table: :users }
      t.integer :status, null: false
      t.timestamps
    end
  end
end
