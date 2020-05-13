class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :introduction, null: true
      t.integer :prefecture, null: true
      t.integer :private, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
