class AddAltToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :alt, :text, null: true
  end
end
