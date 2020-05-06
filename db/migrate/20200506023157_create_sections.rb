class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.text :section_name
      t.string :ancestry, index: true
      t.integer :disclosure
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
