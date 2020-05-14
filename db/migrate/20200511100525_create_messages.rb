class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title, null: true
      t.text :text, null: false
      t.references :friend, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.integer :read, null: false
      t.timestamps
    end
  end
end
